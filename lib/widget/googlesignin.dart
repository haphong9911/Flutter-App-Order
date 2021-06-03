import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_orderapp/screens/homepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_orderapp/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class Googlesignin extends StatefulWidget {
  final Function onpress;
  Googlesignin({this.onpress});
  @override
  _GooglesigninState createState() => _GooglesigninState();
}

class _GooglesigninState extends State<Googlesignin> {
  GoogleSignInProvider googlesignin = GoogleSignInProvider();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        child: Text(
          'Continue with Google',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins-Regular',
              fontSize: 18.0),
        ),
        color: Color(0xff5383EC),

        height: 67.0,
        minWidth: 350.0,
        // highlightColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        onPressed: () async {
          await googlesignin.googleSignIn();
        },
      ),
    );
  }
}
