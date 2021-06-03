import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_orderapp/provider/myprovider.dart';
import 'package:flutter_orderapp/screens/about.dart';
import 'package:flutter_orderapp/screens/body.dart';
import 'package:flutter_orderapp/screens/CartScreen.dart';
import 'package:flutter_orderapp/screens/contact.dart';
import 'package:flutter_orderapp/screens/drawer.dart';
import 'package:flutter_orderapp/screens/login.dart';
import 'package:flutter_orderapp/screens/profile.dart';
import 'package:flutter_orderapp/widget/Constand.dart';
import 'package:flutter_orderapp/widget/notification_button.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  Myprovider myprovider;
  final GlobalKey _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerScreen(),
      endDrawerEnableOpenDragGesture: false,

      // appBar: AppBar(
      //   backgroundColor: Color(0xff53B175),
      //   elevation: 0,
      //   leading: IconButton(icon: Icon(Icons.sort), onPressed: () {}),
      // ),
      body: Body(),
    );
  }
}
