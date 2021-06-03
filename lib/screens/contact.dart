import 'package:flutter/material.dart';
import 'package:flutter_orderapp/screens/homepage.dart';
import 'package:flutter_orderapp/widget/Button.dart';
import 'package:flutter_orderapp/widget/Constand.dart';
import 'package:flutter_orderapp/widget/notification_button.dart';
import 'package:flutter_orderapp/widget/passwordtextfield.dart';
import 'package:flutter_orderapp/widget/textFormfield.dart';
import 'package:google_fonts/google_fonts.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final TextEditingController email = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController message = TextEditingController();

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  void vaildation(context) {
    if (email.text.isEmpty && fullname.text.isEmpty) {
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
    } else if (message.text.isEmpty) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Message rỗng"),
        ),
      );
    } else {}
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent, //No more green
        elevation: 0.0, //Shadow gone
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kPrimaryColor),
          onPressed: () => Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (ctx) => Homepage())),
        ),
        title: Text(
          "Contact Us",
          style: TextStyle(
              fontFamily: 'Poppins-Medium', fontSize: 18, color: kPrimaryColor),
        ),
        centerTitle: true,
        actions: <Widget>[NotificationButton()],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormfield(
                      controller: fullname,
                      title: "Username",
                    ),
                    TextFormfield(
                      controller: email,
                      title: "Email",
                    ),
                    TextFormfield(
                      controller: message,
                      title: "Message",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              child: Center(
                child: Button(
                  name: "Send",
                  onPressed: () {
                    vaildation(context);
                  },
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
