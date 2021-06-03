import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Haveac extends StatelessWidget {
  final String title, subtitle;
  final Function onTap;
  Haveac({this.onTap, this.title, this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.comfortaa(color: Colors.black, fontSize: 18),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
