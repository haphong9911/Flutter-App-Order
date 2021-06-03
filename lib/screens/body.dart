import 'package:flutter/material.dart';
import 'package:flutter_orderapp/provider/myprovider.dart';
import 'package:flutter_orderapp/screens/best_selling.dart';
import 'package:flutter_orderapp/screens/categories.dart';
import 'package:flutter_orderapp/screens/categories_page.dart';
import 'package:flutter_orderapp/screens/feature.dart';
import 'package:flutter_orderapp/screens/foods_page.dart';
import 'package:flutter_orderapp/widget/Title_with_seeall.dart';
import 'package:flutter_orderapp/widget/header_with_searchbox.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Drawer(),
          HeaderWithSearchBox(size: size),
          TitleWithSeeall(
            title: "Categories",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Categories()));
            },
          ),
          ListCategories(),
          SizedBox(
            height: 10,
          ),
          TitleWithSeeall(
            title: "Best Selling",
            press: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Foods()));
            },
          ),
          BestSelling(),
          SizedBox(
            height: 10,
          ),
          TitleWithSeeall(
            title: "Featured",
            press: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Foods()));
            },
          ),
          Featured(),
          // FeaturedSingle()
        ],
      ),
    );
  }
}

class Drawer extends StatelessWidget {
  const Drawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff53B175),
      ),
      padding: EdgeInsets.only(left: 20, top: 20),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Builder(
            builder: (context) => GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(
                  Icons.sort,
                  size: 30,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
