import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_orderapp/screens/homepage.dart';
import 'package:flutter_orderapp/screens/login.dart';
import 'package:flutter_orderapp/widget/Button.dart';
import 'package:google_fonts/google_fonts.dart';

class Skipscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Carousel(
              animationDuration: Duration(seconds: 2),
              autoplay: true,
              boxFit: BoxFit.cover,
              dotBgColor: Colors.transparent,
              dotIncreasedColor: Theme.of(context).primaryColor,
              dotSize: 10,
              images: [
                AssetImage("images/skip.png"),
                AssetImage("images/anhnen.jpg"),
                AssetImage("images/skip.png"),
                AssetImage("images/anhnen.jpg"),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to foodship",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Get your food as fast as one hour",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Button(
                      name: "Get Started",
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => Login(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
