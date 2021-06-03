import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_orderapp/provider/myprovider.dart';
import 'package:flutter_orderapp/screens/CartScreen.dart';
import 'package:flutter_orderapp/widget/Constand.dart';
import 'package:provider/provider.dart';

class NotificationButton extends StatefulWidget {
  @override
  _NotificationButtonState createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  Myprovider productProvider;
  Future<void> myDialogBox(context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Alert"),
            actions: [
              FlatButton(
                child: Text("Clear Notification"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    productProvider.notificationList.clear();
                  });
                },
              ),
              FlatButton(
                child: Text("Okey"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(productProvider.notificationList.isNotEmpty
                      ? "Your Product On Way"
                      : "No Notification At Yet"),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<Myprovider>(context);
    return Badge(
      position: BadgePosition(top: 8),
      badgeContent: Text(
        productProvider.getNotificationIndex.toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      badgeColor: Colors.red,
      child: IconButton(
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.black,
        ),
        onPressed: () {
          myDialogBox(context);
          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (ctx) => CartScreen()));
        },
      ),
    );
  }
}
