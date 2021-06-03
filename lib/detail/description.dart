import 'package:flutter/material.dart';
import 'package:flutter_orderapp/model/Featured.dart';
import 'package:flutter_orderapp/model/Food_model.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.food,
  }) : super(key: key);

  final FeaturedModel food;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 90,
      ),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
          text: "Description\n ",
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text: food.description,
          style: TextStyle(
              height: 1.5,
              fontFamily: 'Poppins-Medium',
              color: Color(0xff7C7C7C)),
        ),
      ])),
    );
  }
}
