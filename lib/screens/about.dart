import 'package:flutter/material.dart';
import 'package:flutter_orderapp/screens/homepage.dart';
import 'package:flutter_orderapp/widget/Constand.dart';
import 'package:flutter_orderapp/widget/notification_button.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, //No more green
        elevation: 0.0, //Shadow gone
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kPrimaryColor),
          onPressed: () => Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (ctx) => Homepage())),
        ),
        title: Text(
          "About Us",
          style: TextStyle(
              fontFamily: 'Poppins-Medium', fontSize: 18, color: kPrimaryColor),
        ),
        centerTitle: true,
        actions: <Widget>[NotificationButton()],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30),
              height: 370,
              width: 350,
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              height: 30,
              width: 370,
              child: Row(
                children: [
                  Text(
                    "Member:",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  Text(
                    " HunHun, ThanhThuy, VanNho, HaPhong",
                    style: GoogleFonts.poppins(
                        fontSize: 14, color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
