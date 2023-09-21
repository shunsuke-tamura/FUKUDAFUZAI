import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fukuda_fuzai/model/document/shoot/shoot_response.dart';
import 'package:fukuda_fuzai/model/document/user_setting/user_setting_response.dart';
import 'package:fukuda_fuzai/model/entity/sensor_per_info/sensor_per_info_entity.dart';
import 'package:fukuda_fuzai/model/entity/shoot/shoot_entity.dart';
import 'package:fukuda_fuzai/model/entity/user_setting/user_setting_entity.dart';
import 'package:fukuda_fuzai/provider/domain_providers.dart';
import 'package:fukuda_fuzai/util/constant/color_constant.dart';
import 'package:fukuda_fuzai/util/constant/enum/message_type_enum.dart';
import 'package:fukuda_fuzai/util/constant/text_style_constant.dart';
import 'package:peerdart/peerdart.dart';
import 'package:fukuda_fuzai/model/document/acc/acc_document.dart';
import 'package:fukuda_fuzai/model/document/gyr/gyr_document.dart';
import 'package:fukuda_fuzai/model/entity/message/message_entity.dart';
import 'package:fukuda_fuzai/provider/presentation_provider.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:vibration/vibration.dart';

class GamePage extends ConsumerStatefulWidget {
  const GamePage(this.id, {Key? key}) : super(key: key);
  final String id;

  @override
  ConsumerState<GamePage> createState() => _RootPageState();
}

class _RootPageState extends ConsumerState<GamePage> {
  AccelerometerEvent acc = AccelerometerEvent(0, 0, 0);
  GyroscopeEvent gyr = GyroscopeEvent(0, 0, 0);
  Peer peer = Peer(options: PeerOptions(debug: LogLevel.All));
  final TextEditingController _controller = TextEditingController();
  String? peerId;
  DataConnection? conn;
  bool connected = false;
  double maxX = 1;
  double maxZ = 1;
  bool isVisibleLazer = true;
  bool isLoading = true;
  bool isFirst = true;
  late DateTime tapTime;

  @override
  void dispose() {
    peer.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      connect(widget.id);
    });
    Future.delayed(const Duration(seconds: 4), () {
      sendUserSetting();
      isLoading = false;
      setState(() {});
    });

    super.initState();

    gyroscopeEvents.listen(
      (GyroscopeEvent event) {
        gyr = event;
        sendBinary();
        ref.read(xRouteProvider.notifier).update((state) => state + event.x);
        ref.read(zRouteProvider.notifier).update((state) => state + event.z);
      },
      onError: (error) {
        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );
  }

  void connect(String id) {
    final connection = peer.connect(
      id,
      options: PeerConnectOption(serialization: SerializationType.JSON),
    );
    conn = connection;

    conn!.on("open").listen((event) {
      setState(() {
        connected = true;
      });

      connection.on("close").listen((event) {
        setState(() {
          connected = false;
        });
      });

      conn!.on("binary").listen((data) {
        print('binary');
        String result = String.fromCharCodes(data);
        Map<dynamic, dynamic> map = jsonDecode(result);
        String strData = utf8.decode(map.values.map((e) => e as int).toList());
        Map<String, dynamic> jsonData = jsonDecode(strData);

        final message = MessageEntity.fromJson(jsonData);
        if (message.type == MessageTypeEnum.shootRes.name) {
          final shootRes = ShootResponse.fromJson(message.data);
          ref
              .read(scoreProvider.notifier)
              .update((state) => state + (shootRes.score ?? 0));
          if (shootRes.score != null) {
            Vibration.vibrate();
          }
        } else if (message.type == MessageTypeEnum.userSettingRes.name) {
          final userSettingRes = UserSettingResponse.fromJson(message.data);
          ref.read(userSettingProvider.notifier).update(
              (state) => UserSettingEntity.fromJson(userSettingRes.toJson()));
        }
      });
    });
  }

  void sendUserSetting() {
    final name = ref.read(nameTextFieldController);
    final userSetting =
        UserSettingEntity(id: 0, name: name.text, colorCode: '');
    final message = MessageEntity(type: 'userSetting', data: userSetting);
    final json = message.toJson();
    final List<int> codeUnits = jsonEncode(json).codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);
    conn?.sendBinary(unit8List);
  }

  void gyroReset() {
    ref.read(xRouteProvider.notifier).update((state) => 0);
    ref.read(zRouteProvider.notifier).update((state) => 0);
  }

  void sendBinary() {
    final xRoute = ref.read(xRouteProvider);
    final zRoute = ref.read(zRouteProvider);
    final xPercent = xRoute / maxX;
    final zPercent = zRoute / maxZ;
    final accDoc = AccDocument(x: acc.x, y: acc.y, z: acc.z);
    final gyrDoc = GyrDocument(x: xPercent, y: gyr.y, z: zPercent);
    final deviceInfo = SensorPerInfoEntity(acc: accDoc, gyro: gyrDoc);
    final message = MessageEntity(type: 'sensorInfo', data: deviceInfo);
    final json = message.toJson();
    final List<int> codeUnits = jsonEncode(json).codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);
    conn?.sendBinary(unit8List);
  }

  void shoot() {
    ref.read(audioProvider).play(AssetSource('audios/burn.mp3'));
    isVisibleLazer = true;
    isFirst = false;
    final xRoute = ref.read(xRouteProvider);
    final zRoute = ref.read(zRouteProvider);
    final xPercent = xRoute / maxX;
    final zPercent = zRoute / maxZ;
    final shoot = ShootEntity(
        id: ref.read(userSettingProvider)!.id,
        sensorPerInfo: SensorPerInfoEntity(
          acc: AccDocument(x: acc.x, y: acc.y, z: acc.z),
          gyro: GyrDocument(x: xPercent, y: gyr.y, z: zPercent),
        ),
        charge:
            DateTime.now().difference(tapTime).abs().inMilliseconds * 0.001);
    final message = MessageEntity(type: 'shoot', data: shoot);
    final json = message.toJson();
    final List<int> codeUnits = jsonEncode(json).codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);
    conn?.sendBinary(unit8List);
    HapticFeedback.heavyImpact();
    setState(() {});
    Future.delayed(const Duration(milliseconds: 50), () {
      isVisibleLazer = false;
      setState(() {});
    });
  }

  void closeConnection() {
    peer.dispose();
  }

  void reconnect() {
    peer = Peer();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading == true) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('しばらくお待ち下さい'),
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    }
    final height = MediaQuery.of(context).size.height;
    final userSetting = ref.watch(userSettingProvider);
    final score = ref.watch(scoreProvider);
    return Scaffold(
      backgroundColor: ColorConstant.black100,
      body: SizedBox(
        height: height,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Visibility(
                        visible: true,
                        child: Container(
                          height: height * 0.45,
                          width: 200,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              AnimatedPositioned(
                                top: isVisibleLazer ? 0 : height * 0.60,
                                duration: const Duration(milliseconds: 50),
                                child: isFirst
                                    ? SizedBox(width: 200,child: Text('1.大砲を長押しして下にスライドすると発射するよ！\n2.画面の中央にスマホを向けて"gyro reset"を押して！\n3.下のバーで感度が変わるよ！'))
                                    : Image.asset(
                                        'assets/images/ball.png',
                                        height: 30,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTapDown: (_) {
                          tapTime = DateTime.now();
                          ref.read(audioProvider).play(AssetSource('audios/moter.mp3'));
                        },
                        onTapUp: (_) => shoot,
                        onTapCancel: shoot,
                        child: AnimatedContainer(
                          alignment: Alignment.topCenter,
                          duration: const Duration(seconds: 1),
                          height: isVisibleLazer ? 100 : height * 0.4,
                          child: SvgPicture.asset(
                            'assets/images/canone.svg',
                            color: Color(int.parse(
                              'FF${userSetting?.colorCode ?? 'FFFFFF'}',
                              radix: 16,
                            )),
                            height: 300,
                          ),
                        ),
                      ),
                      // _renderState(),
                      // SelectableText(peerId ?? ""),
                      // Text('gyr: $gyr'),
                      // ElevatedButton(
                      //     onPressed: closeConnection,
                      //     child: const Text("Close connection,")),
                      // ElevatedButton(
                      //     onPressed: reconnect, child: const Text("Re connect,")),
                    ],
                  ),
                  Platform.isIOS
                      ? IosSlider(
                          userSetting: userSetting,
                          maxX: maxX,
                          onTap: (value) {
                            maxX = 100 - value;
                            maxZ = (100 - value) * 1.3;
                            setState(() {});
                          },
                        )
                      : AndroidSlider(
                          userSetting: userSetting,
                          maxX: maxX,
                          onTap: (value) {
                            maxX = 10 - value;
                            maxZ = (10 - value) * 1.3;
                            setState(() {});
                          },
                        ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(int.parse(
                          'FF${userSetting?.colorCode ?? 'FFFFFF'}',
                          radix: 16,
                        )),
                      ),
                      onPressed: gyroReset,
                      child: const Text("gyro reset")),
                  const SizedBox(height: 32)
                ],
              ),
            ),
            Positioned(
              top: 60,
              child: SizedBox(
                height: 40,
                width: 200,
                child: Column(
                  children: [
                    Text(
                      'id: ${userSetting?.id ?? 404}',
                      style: TextStyleConstant.normal16
                          .copyWith(color: ColorConstant.black0),
                    ),
                    Text(
                      'score: $score',
                      style: TextStyleConstant.normal16
                          .copyWith(color: ColorConstant.black0),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderState() {
    Color bgColor = connected ? Colors.green : Colors.grey;
    Color txtColor = Colors.white;
    String txt = connected ? "Connected" : "Standby";
    return Container(
      decoration: BoxDecoration(color: bgColor),
      child: Text(
        txt,
        style:
            Theme.of(context).textTheme.titleLarge?.copyWith(color: txtColor),
      ),
    );
  }
}

class AndroidSlider extends StatelessWidget {
  const AndroidSlider(
      {Key? key,
      required this.userSetting,
      required this.maxX,
      required this.onTap})
      : super(key: key);
  final UserSettingEntity? userSetting;
  final double maxX;
  final void Function(double value) onTap;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          inactiveTickMarkColor: Color(int.parse(
        'FF${userSetting?.colorCode ?? 'FFFFFF'}',
        radix: 16,
      ))),
      child: Slider(
        activeColor: Color(int.parse(
          'FF${userSetting?.colorCode ?? 'FFFFFF'}',
          radix: 16,
        )),
        inactiveColor: Color(int.parse(
          'FF${userSetting?.colorCode ?? 'FFFFFF'}',
          radix: 16,
        )).withOpacity(0.3),
        thumbColor: Color(int.parse(
          'FF${userSetting?.colorCode ?? 'FFFFFF'}',
          radix: 16,
        )),
        secondaryActiveColor: Color(int.parse(
          'FF${userSetting?.colorCode ?? 'FFFFFF'}',
          radix: 16,
        )),
        min: 1,
        max: 10,
        divisions: 9,
        value: 10 - maxX,
        onChanged: onTap,
      ),
    );
  }
}

class IosSlider extends StatelessWidget {
  const IosSlider(
      {Key? key,
      required this.userSetting,
      required this.maxX,
      required this.onTap})
      : super(key: key);
  final UserSettingEntity? userSetting;
  final double maxX;
  final void Function(double value) onTap;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          inactiveTickMarkColor: Color(int.parse(
        'FF${userSetting?.colorCode ?? 'FFFFFF'}',
        radix: 16,
      ))),
      child: Slider(
        activeColor: Color(int.parse(
          'FF${userSetting?.colorCode ?? 'FFFFFF'}',
          radix: 16,
        )),
        inactiveColor: Color(int.parse(
          'FF${userSetting?.colorCode ?? 'FFFFFF'}',
          radix: 16,
        )).withOpacity(0.3),
        thumbColor: Color(int.parse(
          'FF${userSetting?.colorCode ?? 'FFFFFF'}',
          radix: 16,
        )),
        secondaryActiveColor: Color(int.parse(
          'FF${userSetting?.colorCode ?? 'FFFFFF'}',
          radix: 16,
        )),
        min: 10,
        max: 100,
        divisions: 9,
        value: 100 - maxX,
        onChanged: onTap,
      ),
    );
  }
}
