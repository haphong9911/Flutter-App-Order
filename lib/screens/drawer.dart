import 'package:flutter/material.dart';
import 'package:flutter_orderapp/screens/about.dart';
import 'package:flutter_orderapp/screens/CartScreen.dart';
import 'package:flutter_orderapp/screens/contact.dart';
import 'package:flutter_orderapp/screens/profile.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 220,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xff53B175),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 50),
                          alignment: Alignment.centerLeft,
                          // decoration: ShapeDecoration(
                          //     shape: CircleBorder(
                          //         side: BorderSide(
                          //   width: 2,
                          //   color: Colors.white,
                          // ))),
                          child: CircleAvatar(
                              maxRadius: 35,
                              backgroundImage: AssetImage(
                                "images/avatar.jpg",
                              )),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                                onTap: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Profile()))
                                    },
                                child: Text(
                                  'Tran Ha Phong',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Poppins-Medium'),
                                ))),
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'haphong703@gmail.com',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins-Regular',
                                  letterSpacing: 0.5),
                            )),
                        // ListTile(
                        //   leading: CircleAvatar(
                        //     backgroundColor: Colors.white,
                        //     radius: 28,
                        //     child: CircleAvatar(
                        //       child: Image.asset(
                        //         'assets/images/user.png',
                        //         height: 64,
                        //         width: 67,
                        //       ),
                        //       radius: 50.0,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Color(0xff53B175),
                    size: 30,
                  ),
                  title: Text(
                    'HomePage',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => Contact(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.contact_phone_rounded,
                    color: Color(0xff53B175),
                    size: 30,
                  ),
                  title: Text(
                    'Contact Us',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => About(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.add_alert_rounded,
                    color: Color(0xff53B175),
                    size: 30,
                  ),
                  title: Text(
                    'About Page',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => CartScreen(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.shopping_cart,
                    color: Color(0xff53B175),
                    size: 30,
                  ),
                  title: Text(
                    'Cart',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.logout,
                    color: Color(0xff53B175),
                    size: 30,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
      // Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         decoration: BoxDecoration(color: Colors.blue),
      //         child: Column(),
      //       )
      //     ],
      //   ),
      //   //   child: Column(
      //   //   children: [
      //   //     ListTile(
      //   //       leading: CircleAvatar(
      //   //         radius: 28,
      //   //         backgroundColor: Colors.blueGrey,
      //   //         child: CircleAvatar(
      //   //           radius: 50,
      //   //           backgroundImage: AssetImage('assets/images/joker.jpg'),
      //   //         ),
      //   //       ),
      //   //       title: Text(
      //   //         'Joaquin Phoenix',
      //   //         style: TextStyle(
      //   //           color: Colors.black,
      //   //           fontFamily: 'Roboto',
      //   //           fontWeight: FontWeight.bold,
      //   //           fontSize: 14,
      //   //         ),
      //   //       ),
      //   //       subtitle: Text(
      //   //         "You wouldn't get it",
      //   //         style: TextStyle(
      //   //             color: Colors.black,
      //   //             fontFamily: 'Roboto',
      //   //             fontWeight: FontWeight.w400,
      //   //             fontSize: 10.0),
      //   //       ),
      //   //     )
      //   //   ],
      //   // )

      // )
    );
  }
}
