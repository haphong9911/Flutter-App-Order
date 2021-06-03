import 'package:flutter/material.dart';
import 'package:flutter_orderapp/model/Featured.dart';
import 'package:flutter_orderapp/model/Food_model.dart';
import 'package:flutter_orderapp/provider/myprovider.dart';
import 'package:flutter_orderapp/screens/CartScreen.dart';
import 'package:flutter_orderapp/widget/Button.dart';
import 'package:flutter_orderapp/widget/Constand.dart';
import 'package:provider/provider.dart';
import 'description.dart';
import 'food_titke_with_image.dart';

Myprovider myprovider;

class Body extends StatefulWidget {
  final FeaturedModel food;
  final String image, address, foodtitle;
  final double price;
  final int quantity, count;
  const Body(
      {Key key,
      this.count,
      this.food,
      this.address,
      this.image,
      this.price,
      this.quantity,
      this.foodtitle})
      : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

SizedBox buildOutlineButton({IconData icon, Function press}) {
  return SizedBox(
    width: 40,
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

class _BodyState extends State<Body> {
  Myprovider myprovider;
  int count = 1;
  double totalPrice;
  @override
  Widget build(BuildContext context) {
    setState(() {
      totalPrice = widget.food.price * count;
    });
    Size size = MediaQuery.of(context).size;
    Myprovider myprovider = Provider.of<Myprovider>(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      left: kDefaultPadding, right: kDefaultPadding),
                  margin: EdgeInsets.only(top: size.height * 0.25),
                  // height: 700,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Description(food: widget.food),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Row(
                            children: <Widget>[
                              buildOutlineButton(
                                  icon: Icons.remove,
                                  press: () {
                                    if (count > 1) {
                                      setState(() {
                                        count--;
                                      });
                                    }
                                  }),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding / 2),
                                child: Text(
                                  count.toString().padLeft(2, "0"),
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
                                      count++;
                                    });
                                  })
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: FlatButton(
                          height: 60, minWidth: 370,
                          child: Text(
                            'Add to cart',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins-Regular',
                                fontSize: 18.0),
                          ),
                          color: kPrimaryColor,
                          // highlightColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onPressed: () {
                            myprovider.addNotification("Notification");
                            myprovider.getCartData(
                              image: widget.food.image,
                              foodtitle: widget.food.foodtitle,
                              address: widget.food.address,
                              price: widget.food.price,
                              quantity: count,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.food.foodtitle,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.white,
                              fontFamily: "Poppins-Medium",
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        widget.food.address,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins-Regular',
                            fontSize: 13),
                      ),
                      Row(
                        children: <Widget>[
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Price\n",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Poppins-Medium',
                              ),
                            ),
                            TextSpan(
                                text: "\$${totalPrice.toStringAsFixed(2)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                          ])),
                          SizedBox(width: 150),
                          Expanded(
                            child: Container(
                              width: 180,
                              height: 225,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      widget.food.image,
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CartCounter extends StatefulWidget {
  @override
  _CartConterState createState() => _CartConterState();
}

// ignore: unused_element
class _CartConterState extends State<CartCounter> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            buildOutlineButton(
                icon: Icons.remove,
                press: () {
                  if (quantity > 1) {
                    setState(() {
                      quantity--;
                    });
                  }
                }),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              child: Text(
                quantity.toString().padLeft(2, "0"),
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
                    quantity++;
                  });
                })
          ],
        ),
      ],
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
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
}
