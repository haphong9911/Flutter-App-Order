import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_orderapp/screens/homepage.dart';
import 'package:flutter_orderapp/screens/signup.dart';

// import 'package:foodship/components/background.dart';

// ignore: non_constant_identifier_names
var image_bg = AssetImage("assets/images/2.png");

// ignore: must_be_immutable
class Login extends StatelessWidget {
  // ignore: unused_field
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // ignore: unused_field
  String _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: new Stack(
        children: [
          new ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(image: image_bg, fit: BoxFit.cover)),
            ),
          ),
          new Center(
            child: new ClipRRect(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Image.asset('assets/images/4.png'))
                ],
                // filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                // child: new Container(
                //   width: double.infinity,
                //   height: size.height,
                //   decoration: new BoxDecoration(
                //       color: Colors.grey.shade200.withOpacity(0.05)),
                // ),
              ),
            ),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 298.0,
                height: 54.0,
                margin: EdgeInsets.only(top: 70),
                child: Center(
                  child: Image.asset('assets/images/7.png'),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Login",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 26.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff53B175),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Enter your emails and password",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Email",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      fontSize: 16.0,
                      color: Color(0xff7C7C7C),
                    ),
                  )),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  onChanged: (value) {
                    _email = value.trim();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'htth@gmail.com',
                      focusedBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Color(0xffE2E2E2)),
                          borderRadius: BorderRadius.circular(10.0)),
                      hintStyle: TextStyle(
                        color: Color(0xff181725),
                        fontFamily: 'Poppins-Regular',
                        fontSize: 18.0,
                      )),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Password",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      fontSize: 16.0,
                      color: Color(0xff7C7C7C),
                    ),
                  )),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  obscureText: true,
                  onChanged: (value) {
                    _password = value.trim();
                  },
                  decoration: InputDecoration(
                      hintText: '****',
                      focusedBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Color(0xffE2E2E2)),
                          borderRadius: BorderRadius.circular(10.0)),
                      hintStyle: TextStyle(
                        color: Color(0xff181725),
                        fontFamily: 'Poppins-Regular',
                        fontSize: 18.0,
                      )),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      fontSize: 14,
                      color: Color(0xff181725)),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                alignment: Alignment.center,
                child: FlatButton(
                  onPressed: () {
                    auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Homepage()));
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins-Regular',
                        fontSize: 18.0),
                  ),
                  color: Color(0xff53B175),
                  height: 67.0,
                  minWidth: 350.0,
                  // highlightColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Or connect with social media',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                alignment: Alignment.center,
                child: FlatButton(
                  onPressed: () {},
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
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                alignment: Alignment.center,
                child: FlatButton(
                  onPressed: () {},
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
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()))
                  },
                  child: Text(
                    "Don’t have an account? Singup",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff53B175)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
