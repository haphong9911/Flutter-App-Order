import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_orderapp/detail/body.dart';
import 'package:flutter_orderapp/model/Featured.dart';
import 'package:flutter_orderapp/provider/myprovider.dart';
import 'package:flutter_orderapp/screens/homepage.dart';
import 'package:flutter_orderapp/widget/Button.dart';
import 'package:flutter_orderapp/widget/Constand.dart';
import 'package:flutter_orderapp/widget/notification_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Myprovider myprovider;

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  double totalPrice;
  int count;
  @override
  Widget build(BuildContext context) {
    int index;
    user = FirebaseAuth.instance.currentUser;
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
            "Check Out",
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
          itemBuilder: (ctx, myIndex) {
            index = myIndex;
            return CartItem(
              index: index,
              foodtitle: myprovider.getCartModelList[myIndex].foodtitle,
              address: myprovider.getCartModelList[myIndex].address,
              quantity: myprovider.getCartModelList[myIndex].quantity,
              price: myprovider.getCartModelList[myIndex].price,
              image: myprovider.getCartModelList[myIndex].image,
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

double productprice = 0;
double totalPrice;
double shipping = 1.5;
double total;

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    myprovider = Provider.of<Myprovider>(context);
    myprovider.getCartModelList.forEach((element) {
      productprice = widget.price * widget.quantity;
      totalPrice = productprice * 2;
      total = totalPrice + shipping;
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
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding / 2),
                          child: Text(
                            " X ${widget.quantity.toString()}",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Poppins_Medium",
                                color: kPrimaryColor),
                          ),
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
                          "\$ ${productprice.toString()}",
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

User user;
int index;
Widget _buildButton() {
  return Column(
    children: myprovider.userModelList.map((e) {
      return RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.green,
        child: Text(
          "Order",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          FirebaseFirestore.instance.collection("Order").doc(user.uid).set({
            "Product Name": myprovider.getCartModelList[index].foodtitle,
            "Product Price": myprovider.getCartModelList[index].price,
            "Product Quantity": myprovider.getCartModelList[index].quantity,
            "Total Price": total.toString(),
            "User Name": e.userName,
            "User Email": user.uid,
            "User Address": e.userAddress,
            "User PhoneNumer": e.userPhoneNumber,
            "UserUid": user.uid,
          });
        },
      );
    }).toList(),
  );
}

class Total extends StatelessWidget {
  const Total({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;
    int index;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
      height: 270,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SubTotal:",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "\$${totalPrice.toString()}",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shipping:",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "\$${shipping.toString()}",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "\$${total.toString()}",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            width: 370,
            child: _buildButton(),
          ),
        ],
      ),
    );
  }
}
