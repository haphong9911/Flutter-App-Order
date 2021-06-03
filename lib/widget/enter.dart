import 'package:flutter/material.dart';

class Enter extends StatelessWidget {
  final String title, subTitle;
  Enter({this.subTitle, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subTitle,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
