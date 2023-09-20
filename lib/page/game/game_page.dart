import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fukuda_fuzai/model/document/shoot/shoot_response.dart';
import 'package:fukuda_fuzai/model/document/user_setting/user_setting_response.dart';
import 'package:fukuda_fuzai/model/entity/sensor_per_info/sensor_per_info_entity.dart';
import 'package:fukuda_fuzai/model/entity/shoot/shoot_entity.dart';
import 'package:fukuda_fuzai/model/entity/user_setting/user_setting_entity.dart';
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
  bool isVisibleLazer = false;

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
    const userSetting = UserSettingEntity(id: 0, name: 'フクダ', colorCode: '');
    const message = MessageEntity(type: 'userSetting', data: userSetting);
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
    final xRoute = ref.read(xRouteProvider);
    final zRoute = ref.read(zRouteProvider);
    final xPercent = xRoute / maxX;
    final zPercent = zRoute / maxZ;
    final shoot = ShootEntity(
        sensorPerInfo: SensorPerInfoEntity(
      acc: AccDocument(x: acc.x, y: acc.y, z: acc.z),
      gyro: GyrDocument(x: xPercent, y: gyr.y, z: zPercent),
    ));
    final message = MessageEntity(type: 'shoot', data: shoot);
    final json = message.toJson();
    final List<int> codeUnits = jsonEncode(json).codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);
    conn?.sendBinary(unit8List);
    HapticFeedback.vibrate();
    isVisibleLazer = true;
    setState(() {});
    Future.delayed(const Duration(milliseconds: 200), () {
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
    final userSetting = ref.watch(userSettingProvider);
    final score = ref.watch(scoreProvider);
    return Scaffold(
      backgroundColor: ColorConstant.black100,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Visibility(
                  visible: isVisibleLazer,
                  child: Image.asset('assets/images/lazer2.gif'),
                ),
                GestureDetector(
                  onTap: shoot,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: isVisibleLazer ? 100 : 500,
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
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTickMarkColor:  Color(int.parse(
                      'FF${userSetting?.colorCode ?? 'FFFFFF'}',
                      radix: 16,
                    ))
                  ),
                  child: Slider(
                    activeColor: Color(int.parse(
                      'FF${userSetting?.colorCode ?? 'FFFFFF'}',
                      radix: 16,
                    )),
                    inactiveColor:  Color(int.parse(
                      'FF${userSetting?.colorCode ?? 'FFFFFF'}',
                      radix: 16,
                    )).withOpacity(0.3),
                    thumbColor:  Color(int.parse(
                      'FF${userSetting?.colorCode ?? 'FFFFFF'}',
                      radix: 16,
                    )),
                    secondaryActiveColor:  Color(int.parse(
                      'FF${userSetting?.colorCode ?? 'FFFFFF'}',
                      radix: 16,
                    )),

                    min: 1,
                    max: 10,
                    divisions: 9,
                    value: 10 - maxX,
                    onChanged: (value) {
                      maxX = 10 - value;
                      maxZ = (10 - value) * 1.3;
                      setState(() {});
                    },
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(int.parse(
                      'FF${userSetting?.colorCode ?? 'FFFFFF'}',
                      radix: 16,
                    )),
                  ),
                    onPressed: gyroReset, child: const Text("gyro reset")),
                const SizedBox(height: 32)
                // ElevatedButton(
                //     onPressed: closeConnection,
                //     child: const Text("Close connection,")),
                // ElevatedButton(
                //     onPressed: reconnect, child: const Text("Re connect,")),
              ],
            ),
          ),
          Positioned(
            top: 60,
            child: SizedBox(
              height: 40,
              width: 80,
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
