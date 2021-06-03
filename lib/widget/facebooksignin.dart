import 'package:flutter/material.dart';

class Facebooksignin extends StatelessWidget {
  final Function onpress, ontap;
  Facebooksignin({this.onpress, this.ontap});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: onpress,
        child: Text(
          'Continue with Facebook',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins-Regular',
              fontSize: 18.0),
        ),
        color: Color(0xff4A66AC),
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
