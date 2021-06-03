import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_orderapp/model/HomeCategories.dart';
import 'package:flutter_orderapp/provider/myprovider.dart';
import 'package:flutter_orderapp/screens/CartScreen.dart';
import 'package:flutter_orderapp/screens/homepage.dart';
import 'package:flutter_orderapp/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_orderapp/screens/profile.dart';
import 'package:flutter_orderapp/screens/skipscreen.dart';
import 'package:flutter_orderapp/screens/splash.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Google SignIn';
  static final FacebookLogin facebookLogin = new FacebookLogin();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Myprovider>(
      create: (ctx) => Myprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xff53B175),
          accentColor: Color(0xff181725),
        ),
        // home: StreamBuilder(
        //     stream: FirebaseAuth.instance.authStateChanges(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         return Homepage();
        //       } else {
        //         return Login();
        //       }
        //     }),
        home: SplashScreen(),
      ),
    );
  }
}
