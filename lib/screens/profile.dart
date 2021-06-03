import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_orderapp/screens/homepage.dart';
import 'package:flutter_orderapp/widget/Button.dart';
import 'package:flutter_orderapp/widget/passwordtextfield.dart';
import 'package:flutter_orderapp/widget/textFormfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isEdit = false;
  bool isMale = false;
  final TextEditingController email = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();
  File image;
  Future<void> getImage({ImageSource imageSource}) async {
    PickedFile pickedfile = await ImagePicker().getImage(source: imageSource);
    if (pickedfile != null) {
      image = File(pickedfile.path);
    }
  }

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
    } else {}
  }

  Future<void> myDialogueBox() {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: ((BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    leading: Icon(Icons.camera),
                    title: Text("Camera"),
                    onTap: () {
                      getImage(
                        imageSource: ImageSource.camera,
                      );
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text("Gallery"),
                    onTap: () {
                      getImage(
                        imageSource: ImageSource.gallery,
                      );
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }));
  }

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  Widget _BuildAllTextForm() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormfield(
            controller: fullname,
            title: "Họ và Tên",
          ),
          TextFormfield(
            controller: email,
            title: "Email",
          ),
          TextFormfield(
            controller: phoneNumber,
            title: "Số Điện Thoại",
          ),
          TextFormfield(
            controller: address,
            title: "Địa Chỉ",
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
                isMale == false ? "Nữ" : "Nam",
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
            title: "Mật Khẩu",
          ),
          Button(
            name: "Update",
            onPressed: () {
              vaildation(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _BuildSingleContainer({String name}) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10),
      height: 60,
      color: Color(0xfffeeaf4),
      child: Text(
        name,
        style: GoogleFonts.poppins(
          fontSize: 18,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isEdit = !isEdit;
                });
              },
              child: Text(
                isEdit == false ? "Edit" : "Close",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => Homepage(),
                ),
              );
            }),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 220,
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        maxRadius: 60,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          maxRadius: 55,
                          backgroundImage: AssetImage("images/avatar.jpg"),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    color: Colors.white,
                    child: isEdit == false
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _BuildSingleContainer(name: "Trần Hà Phong"),
                              _BuildSingleContainer(
                                  name: "haphong703@gmail.com"),
                              _BuildSingleContainer(name: "0905735852"),
                              _BuildSingleContainer(name: "126 tran cao van"),
                              _BuildSingleContainer(name: "Nam"),
                            ],
                          )
                        : _BuildAllTextForm(),
                  ),
                ),
              ],
            ),
            isEdit != false
                ? Positioned(
                    top: 125,
                    left: 225,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: 20,
                      child: IconButton(
                        icon: Icon(Icons.edit),
                        color: Colors.black,
                        onPressed: () {
                          myDialogueBox();
                        },
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
