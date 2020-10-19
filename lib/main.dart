import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() {
  runApp(SnackBarDemo());
}

class SnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);

    return MaterialApp(
      title: 'هضباوي تاكسي',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SnackBarPage(),
        backgroundColor: Colors.black,
      ),
    );
  }
}

class SnackBarPage extends StatefulWidget {
  @override
  _SnackBarPageState createState() => _SnackBarPageState();
}

class _SnackBarPageState extends State<SnackBarPage> {
  final snackBar = SnackBar(
    backgroundColor: Color(0xFFF8C72D),
    content: Text(
      'There is no whatsapp installed, please install it and turn on mobile data or wifi',
      style: TextStyle(color: Colors.black),
    ),
  );

  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterOpenWhatsapp.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Image.asset(
            'assets/wallpaper.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 350,
            left: 10,
            right: 10,
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              child: FlatButton(
                color: Colors.black,
                onPressed: () async {
                  FlutterOpenWhatsapp.sendSingleMessage("+201552369082", "");
                },
                child: Center(
                  child: Text(
                    'Order Now',
                    style: TextStyle(color: Color(0xFFF8C72D)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
