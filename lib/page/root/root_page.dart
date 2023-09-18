import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:peerdart/peerdart.dart';
import 'package:wordwolf/model/document/acc/acc_document.dart';
import 'package:wordwolf/model/document/gyr/gyr_document.dart';
import 'package:wordwolf/model/entity/device_info/device_info_entity.dart';
import 'package:wordwolf/model/entity/message/message_entity.dart';
import 'package:wordwolf/util/constant/color_constant.dart';
import 'package:wordwolf/util/constant/text_style_constant.dart';
import 'package:sensors_plus/sensors_plus.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AccelerometerEvent acc = AccelerometerEvent(0, 0, 0);
  GyroscopeEvent gyr = GyroscopeEvent(0, 0, 0);
  Peer peer = Peer(options: PeerOptions(debug: LogLevel.All));
  final TextEditingController _controller = TextEditingController();
  String? peerId;
  DataConnection? conn;
  bool connected = false;

  @override
  void dispose() {
    peer.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
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

      conn!.on("binary").listen((data) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Got binary")));
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

  void connect() {
    final connection = peer.connect(
      _controller.text,
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

      conn!.on("data").listen((data) {
        print('data');
        print(data);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data)));
      });
      conn!.on("binary").listen((data) {
        print('binary');
        print(data);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Got binary!")));
      });
    });
  }

  void sendBinary() {
    final accDoc = AccDocument(x: acc.x, y: acc.y, z: acc.z);
    final gyrDoc = GyrDocument(x: gyr.x, y: gyr.y, z: gyr.z);
    final deviceInfo = DeviceInfoEntity(acc: accDoc, gyro: gyrDoc);
    final message = MessageEntity(type: 'sensorInfo', data: deviceInfo);
    final json = message.toJson();
    final List<int> codeUnits = jsonEncode(json).codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);
    conn!.sendBinary(unit8List);
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
              TextFormField(
                controller: _controller,
                textAlign: TextAlign.left,
                autofocus: true,
                cursorColor: ColorConstant.black30,
                decoration: const InputDecoration(
                  fillColor: ColorConstant.black90,
                  filled: true,
                  hintText: 'メッセージを入力',
                  hintStyle:
                      TextStyle(fontSize: 16, color: ColorConstant.black50),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyleConstant.normal16
                    .copyWith(color: ColorConstant.black30),
              ),
              ElevatedButton(onPressed: connect, child: const Text("connect")),
              ElevatedButton(
                  onPressed: sendBinary,
                  child: const Text("Send binary to peer")),
              ElevatedButton(
                  onPressed: closeConnection,
                  child: const Text("Close connection,")),
              ElevatedButton(
                  onPressed: reconnect, child: const Text("Re connect,")),
            ],
          ),
        ));
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
