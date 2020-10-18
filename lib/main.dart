import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(SnackBarDemo());
}

class SnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'هضباوي تاكسي',
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text(
            'هضباوي تاكسي',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SnackBarPage(),
        backgroundColor: Colors.black,
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  final snackBar = SnackBar(
    backgroundColor: Colors.yellow,
    content: Text(
      'من فضلك قم بتثبيت تطبيق الواتس أب',
      style: TextStyle(color: Colors.black),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            color: Colors.yellow,
            onPressed: () async {
              var whatsappUrl = "whatsapp://send?phone=+201142174779";
              await canLaunch(whatsappUrl)
                  ? launch(whatsappUrl)
                  : Scaffold.of(context).showSnackBar(snackBar);
            },
            child: Center(
              child: Text(
                'أطلب الأن',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
