import 'package:flutter/material.dart';

class Passwordtextfield extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  Passwordtextfield({this.title, this.controller});

  @override
  _PasswordtextfieldState createState() => _PasswordtextfieldState();
}

class _PasswordtextfieldState extends State<Passwordtextfield> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Icon(
              obscureText == true ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          fillColor: Color(0xffffffff),
          filled: false,
          labelText: widget.title,
          labelStyle: TextStyle(
            color: Color(0xff888888),
            fontSize: 20,
          )),
    );
  }
}
