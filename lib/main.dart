import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(SnackBarDemo());
}

class SnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);

    return MaterialApp(
      title: 'هضباوي تاكسي',
      home: Scaffold(
        body: SnackBarPage(),
        backgroundColor: Colors.black,
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  final snackBar = SnackBar(
    backgroundColor: Color(0xFFF8C72D),
    content: Text(
      'There is no whatsapp installed, please install it and turn on mobile data or wifi',
      style: TextStyle(color: Colors.black),
    ),
  );

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
            top: 500,
            left: 150,
            child: FlatButton(
              color: Colors.black,
              onPressed: () async {
                var whatsappUrl = "whatsapp://send?phone=+201552369082";
                await canLaunch(whatsappUrl)
                    ? launch(whatsappUrl)
                    : Scaffold.of(context).showSnackBar(snackBar);
              },
              child: Center(
                child: Text(
                  'Order Now',
                  style: TextStyle(color: Color(0xFFF8C72D)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
