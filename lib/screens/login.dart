import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_orderapp/provider/google_sign_in.dart';
import 'package:flutter_orderapp/screens/homepage.dart';
import 'package:flutter_orderapp/screens/signup.dart';
import 'package:flutter_orderapp/widget/Button.dart';
import 'package:flutter_orderapp/widget/enter.dart';
import 'package:flutter_orderapp/widget/facebooksignin.dart';
import 'package:flutter_orderapp/widget/googlesignin.dart';
import 'package:flutter_orderapp/widget/haveac.dart';
import 'package:flutter_orderapp/widget/passwordtextfield.dart';
import 'package:flutter_orderapp/widget/textFormfield.dart';
import 'package:flutter_orderapp/widget/toptitle.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GoogleSignInProvider googlesignin = GoogleSignInProvider();
  final TextEditingController email = TextEditingController();
  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  final emailTextcontroler = TextEditingController();
  final passwordTextcontroler = TextEditingController();
  bool isLoading = false;

  UserCredential authResult;

  void submit() async {
    setState(() {
      isLoading = true;
    });
    try {
      authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => Homepage(),
        ),
      );
    } on PlatformException catch (e) {
      String message = "Kiểm tra kết nối mạng";
      if (e.message != null) {
        message = e.message.toString();
      }
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text(message.toString()),
        ),
      );
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      setState(() {
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  void vaildation(context) {
    if (email.text.isEmpty && password.text.isEmpty) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Email và password rỗng"),
        ),
      );
    } else if (email.text.isEmpty) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Email rỗng"),
        ),
      );
    } else if (password.text.isEmpty) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Password rỗng"),
        ),
      );
    } else if (password.text.length < 8) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Password quá ngắn"),
        ),
      );
    } else {
      submit();
    }
  }

  final TextEditingController password = TextEditingController();

  Widget _buildTextFormField() {
    return Container(
      height: 200,
      width: 370,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormfield(
            title: "Email",
            controller: email,
          ),
          SizedBox(
            height: 10,
          ),
          Passwordtextfield(
            title: "Password",
            controller: password,
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return isLoading == false
        ? Button(
            name: "Login",
            onPressed: () {
              vaildation(context);
            },
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfffefefe),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/main.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: Column(
            children: [
              Toptitle(
                subTitle: "Chào Mừng Bạn!",
                title: "foodship",
              ),
              SizedBox(
                height: 10,
              ),
              Enter(
                title: "Login",
                subTitle: "Enter your email and password",
              ),
              _buildTextFormField(),
              SizedBox(
                height: 10,
              ),
              _buildButton(),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 20,
                child: Text(
                  "or connect with social media",
                  style: GoogleFonts.comfortaa(
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Googlesignin(),
              SizedBox(
                height: 20,
              ),
              Facebooksignin(
                onpress: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => Homepage()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              Haveac(
                title: "You don't have account? ",
                subtitle: "Sign up here",
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => Signup(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
