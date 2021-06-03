import 'package:flutter/material.dart';
import 'package:flutter_orderapp/screens/searchpage.dart';
import 'package:flutter_orderapp/widget/Constand.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      height: size.height * 0.23,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 20 + kDefaultPadding,
            ),
            height: size.height * 0.23 - 27,
            decoration: BoxDecoration(
              color: Color(0xff53B175),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36)),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: ShapeDecoration(
                      shape: CircleBorder(
                          side: BorderSide(
                    width: 2,
                    color: Colors.white,
                  ))),
                  child: CircleAvatar(
                    maxRadius: 35,
                    backgroundImage: AssetImage(
                      "images/avatar.jpg",
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'What do you want?',
                    style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                  color: Color(0xffF2F3F2),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 40,
                      color: Theme.of(context).primaryColor,
                    )
                  ]),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search.....",
                          hintStyle: TextStyle(
                            color: Color(0xff9E9E9E),
                            fontSize: 14.0,
                            fontFamily: 'Poppins-Regular',
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => SearchPage()));
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
