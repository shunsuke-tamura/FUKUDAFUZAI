import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fukuda_fuzai/model/document/shoot/shoot_response.dart';
import 'package:fukuda_fuzai/model/entity/sensor_per_info/sensor_per_info_entity.dart';
import 'package:fukuda_fuzai/model/entity/shoot/shoot_entity.dart';
import 'package:fukuda_fuzai/model/entity/user_setting/user_setting_entity.dart';
import 'package:peerdart/peerdart.dart';
import 'package:fukuda_fuzai/model/document/acc/acc_document.dart';
import 'package:fukuda_fuzai/model/document/gyr/gyr_document.dart';
import 'package:fukuda_fuzai/model/entity/message/message_entity.dart';
import 'package:fukuda_fuzai/provider/presentation_provider.dart';
import 'package:sensors_plus/sensors_plus.dart';

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

  @override
  void dispose() {
    peer.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      connect(widget.id);
    });
    Future.delayed(Duration(seconds: 4), () {
      sendUserSetting();
    });

    super.initState();

    accelerometerEvents.listen(
      (AccelerometerEvent event) {
        acc = event;
        sendBinary();
      },
      onError: (error) {
        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );

    gyroscopeEvents.listen(
      (GyroscopeEvent event) {
        gyr = event;
        sendBinary();
        // print(event);
        ref.read(xRouteProvider.notifier).update((state) => state + event.x);
        ref.read(zRouteProvider.notifier).update((state) => state + event.z);
      },
      onError: (error) {
        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );

    peer.on("open").listen((id) {
      setState(() {
        peerId = peer.id;
      });
    });

    peer.on("close").listen((id) {
      setState(() {
        connected = false;
      });
    });

    peer.on<DataConnection>("connection").listen((event) {
      conn = event;

      conn!.on("data").listen((data) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data)));
      });

      conn!.on("close").listen((event) {
        setState(() {
          connected = false;
        });
      });

      setState(() {
        connected = true;
      });
    });
  }

  void connect(String id) {
    final connection = peer.connect(
      id,
      options: PeerConnectOption(serialization: SerializationType.JSON),
    );
    conn = connection;
    print('コネクト');

    conn!.on("open").listen((event) {
      setState(() {
        connected = true;
      });

      connection.on("close").listen((event) {
        setState(() {
          connected = false;
        });
      });

      conn!.on("data").listen((data) {
        print('data');
        print(data);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data)));
      });
      conn!.on("binary").listen((data) {
        print('binary');
        String result = String.fromCharCodes(data);
        Map<dynamic, dynamic> map = jsonDecode(result);
        String strData = utf8.decode(map.values.map((e) => e as int).toList());
        Map<String, dynamic> jsonData = jsonDecode(strData);
        print(jsonData);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Got binary!")));

        final message = MessageEntity.fromJson(jsonData);
        if (message.type == "shootRes") {
          final shootRes = message.data as ShootResponse;
          ref
              .read(scoreProvider.notifier)
              .update((state) => state + (shootRes.score ?? 0));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("score: ${ref.read(scoreProvider.notifier)}")));
        }
      });
    });
  }

  void sendUserSetting() {
    const userSetting = UserSettingEntity(name: 'フクダ');
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
  }

  void closeConnection() {
    peer.dispose();
  }

  void reconnect() {
    peer = Peer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _renderState(),
            const Text(
              'Connection ID:',
            ),
            SelectableText(peerId ?? ""),
            Text('gyr: $gyr'),
            Slider(
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
            ElevatedButton(
                onPressed: gyroReset, child: const Text("gyro reset")),
            ElevatedButton(onPressed: shoot, child: const Text('shoot')),
            ElevatedButton(
                onPressed: closeConnection,
                child: const Text("Close connection,")),
            ElevatedButton(
                onPressed: reconnect, child: const Text("Re connect,")),
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