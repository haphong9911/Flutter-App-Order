import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_orderapp/screens/homepage.dart';
import 'package:flutter_orderapp/widget/Button.dart';
import 'package:flutter_orderapp/widget/gender.dart';
import 'package:flutter_orderapp/widget/haveac.dart';
import 'package:flutter_orderapp/widget/passwordtextfield.dart';
import 'package:flutter_orderapp/widget/textFormfield.dart';
import 'package:flutter_orderapp/widget/toptitle.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isMale = false;
  bool isLoading = false;
  UserCredential authResult;
  void submit() async {
    setState(() {
      isLoading = true;
    });
    try {
      authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
    } on PlatformException catch (e) {
      String message = "Kiểm tra kết nối mạng";
      if (e.message != null) {
        message = e.message.toString();
      }
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
    FirebaseFirestore.instance
        .collection("UserData")
        .doc(authResult.user.uid)
        .set({
      "UserName": fullname.text,
      "UserEmail": email.text,
      "UserNumber": phoneNumber.text,
      "UserID": authResult.user.uid,
      "UserAddress": address.text,
      "UserGender": isMale == false ? "Nam" : "Nữ",
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => Homepage(),
      ),
    );
    setState(() {
      isLoading = false;
    });
  }

  final TextEditingController email = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();
  void vaildation(context) {
    if (email.text.isEmpty &&
        password.text.isEmpty &&
        fullname.text.isEmpty &&
        phoneNumber.text.isEmpty &&
        address.text.isEmpty) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Tất cả rỗng"),
        ),
      );
    } else if (address.text.isEmpty) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Địa Chỉ rỗng"),
        ),
      );
    } else if (email.text.length < 10) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Số Điện Thoại không đúng "),
        ),
      );
    } else if (phoneNumber.text.isEmpty) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Số Điện Thoại rỗng"),
        ),
      );
    } else if (fullname.text.isEmpty) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Họ Và Tên rỗng"),
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
    } else if (password.text.length < 9) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Password quá ngắn"),
        ),
      );
    } else {
      submit();
    }
  }

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  Widget _buildAllTextForm() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/main1.png"),
          fit: BoxFit.cover,
        ),
      ),
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormfield(
            controller: fullname,
            title: "Fullname",
          ),
          TextFormfield(
            controller: email,
            title: "Email",
          ),
          TextFormfield(
            controller: phoneNumber,
            title: "Phone Number",
          ),
          TextFormfield(
            controller: address,
            title: "Address",
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isMale = !isMale;
              });
            },
            child: Container(
              height: 60,
              width: double.infinity,
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                isMale == false ? "Woman" : "Man",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Passwordtextfield(
            controller: password,
            title: "Password",
          )
        ],
      ),
    );
  }

  Widget _buildButton() {
    return isLoading == false
        ? Button(
            name: "Sign up",
            onPressed: () {
              vaildation(context);
            },
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget _buildHaveac() {
    return Haveac(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => Login(),
          ),
        );
      },
      subtitle: "Login here",
      title: "You have account yet? ",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffold,
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Toptitle(
                    title: "Sign up",
                  ),
                  _buildAllTextForm(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildButton(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildHaveac(),
                ],
              ),
            ],
          ),
        ));
  }
}
