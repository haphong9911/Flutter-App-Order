import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_orderapp/detail/body.dart';
import 'package:flutter_orderapp/model/Bestselling.dart';
import 'package:flutter_orderapp/model/Featured.dart';
import 'package:flutter_orderapp/widget/Constand.dart';
import 'package:flutter_orderapp/widget/notification_button.dart';

class DetailScreen extends StatelessWidget {
  final FeaturedModel food;
  final BestsellingModel bestsell;

  const DetailScreen({Key key, this.food, this.bestsell}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent, //No more green
        elevation: 0.0, //Shadow gone
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Detail",
          style: TextStyle(
              fontFamily: 'Poppins-Medium', fontSize: 18, color: kPrimaryColor),
        ),
        centerTitle: true,
        actions: <Widget>[NotificationButton()],
      ),
      body: Body(
        food: food,
      ),
    );
  }
}
