import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [new Image.asset("assets/images/bulb.jpg")])));
  }
}
