import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_orderapp/screens/login.dart';
import 'package:flutter_orderapp/screens/skipscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Skipscreen()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff53b175),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("images/logo.png"),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 2,
            )
          ],
        ),
      ),
    );
  }
}
