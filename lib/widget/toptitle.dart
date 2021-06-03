import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Toptitle extends StatelessWidget {
  final String title, subTitle;
  Toptitle({this.subTitle, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: GoogleFonts.comfortaa(
                fontSize: 35,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
