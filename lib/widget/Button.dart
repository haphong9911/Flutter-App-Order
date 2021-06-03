import 'package:flutter/material.dart';
import 'package:flutter_orderapp/widget/Constand.dart';

class Button extends StatelessWidget {
  final String name;
  final Function onPressed;
  Button({this.name, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          name,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins-Regular',
              fontSize: 18.0),
        ),
        color: kPrimaryColor,
        height: 67.0,
        minWidth: 350.0,
        // highlightColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
