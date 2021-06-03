import 'package:flutter/material.dart';
import 'package:flutter_orderapp/widget/Constand.dart';

class TitleWithSeeall extends StatelessWidget {
  const TitleWithSeeall({
    Key key,
    this.press,
    this.title,
  }) : super(key: key);
  final String title;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          TitleWithCustomUnderLine(text: title),
          Spacer(),
          GestureDetector(
            onTap: press,
            child: Text(
              "See all",
              style: TextStyle(
                  fontFamily: 'Gabriola',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff53B175)),
            ),
          )
        ],
      ),
    );
  }
}

class TitleWithCustomUnderLine extends StatelessWidget {
  const TitleWithCustomUnderLine({
    Key key,
    this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: 'Gabriola',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xff181725)),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: kDefaultPadding / 4),
              height: 7,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}
