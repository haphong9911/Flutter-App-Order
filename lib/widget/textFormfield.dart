import 'package:flutter/material.dart';

class TextFormfield extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  TextFormfield({this.title, this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          fillColor: Color(0x00000000),
          filled: true,
          labelText: title,
          labelStyle: TextStyle(
            color: Color(0xff888888),
            fontSize: 20,
          )),
    );
  }
}
