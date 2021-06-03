import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  final bool isMale;
  final Function onTap;
  Gender({this.isMale, this.onTap});
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        padding: EdgeInsets.only(left: 10),
        alignment: Alignment.centerLeft,
        child: Text(
          widget.isMale == false ? "Nữ" : "Nam",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        decoration: BoxDecoration(
            color: Color(0xfffffff), borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
