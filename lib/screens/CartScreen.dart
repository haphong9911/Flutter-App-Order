import 'package:flutter/material.dart';
import 'package:flutter_orderapp/detail/body.dart';
import 'package:flutter_orderapp/model/Featured.dart';
import 'package:flutter_orderapp/provider/myprovider.dart';
import 'package:flutter_orderapp/screens/checkout.dart';
import 'package:flutter_orderapp/screens/homepage.dart';
import 'package:flutter_orderapp/widget/Button.dart';
import 'package:flutter_orderapp/widget/Constand.dart';
import 'package:flutter_orderapp/widget/notification_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Myprovider myprovider;

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double totalPrice;
  int count;
  @override
  Widget build(BuildContext context) {
    myprovider = Provider.of<Myprovider>(context);
    myprovider.getFeatured();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent, //No more green
          elevation: 0.0, //Shadow gone
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: kPrimaryColor),
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => Homepage())),
          ),
          title: Text(
            "Cart",
            style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 18,
                color: kPrimaryColor),
          ),
          centerTitle: true,
          actions: <Widget>[NotificationButton()],
        ),
        bottomNavigationBar: Total(),
        body: ListView.builder(
          itemCount: myprovider.getCartModelListlength,
          itemBuilder: (ctx, index) {
            return CartItem(
              index: index,
              foodtitle: myprovider.getCartModelList[index].foodtitle,
              address: myprovider.getCartModelList[index].address,
              quantity: myprovider.getCartModelList[index].quantity,
              price: myprovider.getCartModelList[index].price,
              image: myprovider.getCartModelList[index].image,
            );
          },
        ));
  }
}

class CartItem extends StatefulWidget {
  final FeaturedModel food;
  final String foodtitle, address, image;
  final double price;
  final int index;
  int quantity;
  CartItem(
      {Key key,
      this.food,
      this.index,
      this.address,
      this.foodtitle,
      this.image,
      this.price,
      this.quantity})
      : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

double productprice;
double totalPrice;

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    myprovider = Provider.of<Myprovider>(context);
    myprovider.getCartModelList.forEach((element) {
      productprice = widget.price * widget.quantity;
    });
    return Container(
      // height: double.infinity,
      // width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              height: 130,
              width: 130,
              child: Container(
                height: 110,
                child:
                    Image.network(widget.image, width: 120, fit: BoxFit.cover),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                height: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.foodtitle,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          widget.address,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Row(
                              children: <Widget>[
                                buildOutlineButton(
                                    icon: Icons.remove,
                                    press: () {
                                      if (widget.quantity > 1) {
                                        setState(() {
                                          widget.quantity--;
                                        });
                                      }
                                    }),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding / 2),
                                  child: Text(
                                    widget.quantity.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Poppins_Medium",
                                        color: kPrimaryColor),
                                  ),
                                ),
                                buildOutlineButton(
                                    icon: Icons.add,
                                    press: () {
                                      setState(() {
                                        widget.quantity++;
                                      });
                                    })
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            myprovider.deleteCartProduct(widget.index);
                          },
                        ),
                        Text(
                          "\$ ${productprice.toStringAsFixed(2)}",
                          style: GoogleFonts.poppins(
                              fontSize: 18, color: Color(0xff53B175)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class CartCounter extends StatefulWidget {
//   final int count;
//   CartCounter({this.count});
//   @override
//   _CartConterState createState() => _CartConterState();
// }

// ignore: unused_element
// class _CartConterState extends State<CartCounter> {
//   int count = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: <Widget>[
//             buildOutlineButton(
//                 icon: Icons.remove,
//                 press: () {
//                   if (count > 1) {
//                     setState(() {
//                       count--;
//                     });
//                   }
//                 }),
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
//               child: Text(
//                 count.toString(),
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontFamily: "Poppins_Medium",
//                     color: kPrimaryColor),
//               ),
//             ),
//             buildOutlineButton(
//                 icon: Icons.add,
//                 press: () {
//                   setState(() {
//                     count++;
//                   });
//                 })
//           ],
//         ),
//       ],
//     );
//   }

SizedBox buildOutlineButton({IconData icon, Function press}) {
  return SizedBox(
    width: 30,
    height: 32,
    child: OutlineButton(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(13)),
      onPressed: press,
      child: Icon(icon),
    ),
  );
}

class Total extends StatelessWidget {
  const Total({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xffdadada).withOpacity(0.15)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Color(0xff53B175),
            height: 3,
            width: double.infinity,
          ),
          Container(
            height: 60,
            width: 370,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Theme.of(context).primaryColor,
              child: Text(
                "Order",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                myprovider.addNotification("Notification");
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => CheckoutScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
