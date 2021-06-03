import 'package:flutter/material.dart';
import 'package:flutter_orderapp/screens/homepage.dart';

var image_bg = AssetImage("images/bgok.png");

class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: new Stack(
        children: [
          new ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Container(
              alignment: Alignment.topRight,
              // width: 650.0,
              // height: 233.0,
              decoration: BoxDecoration(
                  image: DecorationImage(image: image_bg, fit: BoxFit.cover)),
            ),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 60),
                // padding: EdgeInsets.only(left: 100),
                height: 240,
                width: 270,
                child: Image.asset('images/ok.png'),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                margin: EdgeInsets.only(left: 60),
                alignment: Alignment.center,
                height: 84,
                width: 292,
                child: Text(
                  "Your Order has been accepted",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff181725),
                    fontFamily: 'Poppins-Regular',
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              Container(
                alignment: Alignment.center,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Homepage()));
                  },
                  child: Text(
                    'Back to Home',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins-Regular',
                        fontSize: 18.0),
                  ),
                  color: Color(0xff53B175),
                  height: 67.0,
                  minWidth: 353.0,
                  // highlightColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
