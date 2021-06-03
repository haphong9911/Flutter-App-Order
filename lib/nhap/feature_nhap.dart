import 'package:flutter/material.dart';
import 'package:flutter_orderapp/model/Food_model.dart';
import 'package:flutter_orderapp/widget/Constand.dart';

class Featured extends StatelessWidget {
  const Featured({
    Key key,
    this.food,
  }) : super(key: key);
  final Food food;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: ListView(
        children: [
          FeaturedSingle(
            foodtitle: "Pumpkin Soup",
            image: "images/10.png",
            address: "DaNang Hotel",
            rating: "4.0",
            price: "10.00",
          ),
          FeaturedSingle(
            foodtitle: "Fruite Salad",
            image: "images/11.png",
            address: "DaNang Hotel",
            rating: "4.0",
            price: "4.99",
          ),
          FeaturedSingle(
            foodtitle: "Salmon Carpaccio",
            image: "images/12.png",
            address: "DaNang Hotel",
            rating: "5",
            price: "9.00",
          ),
          FeaturedSingle(
              foodtitle: "Steak Dry-aged Ribeye",
              image: "images/13.png",
              address: "DaNang Hotel",
              rating: "4.5",
              price: "9.00"),
          FeaturedSingle(
              foodtitle: "Steak Dry-aged Ribeye",
              image: "images/13.png",
              address: "DaNang Hotel",
              rating: "4.5",
              price: "9.00"),
          FeaturedSingle(
            foodtitle: "Pumpkin Soup",
            image: "images/10.png",
            address: "DaNang Hotel",
            rating: "4.0",
            price: "10.00",
          ),
        ],
      ),
    );
  }
}

class FeaturedSingle extends StatelessWidget {
  const FeaturedSingle({
    Key key,
    this.foodtitle,
    this.image,
    this.address,
    this.rating,
    this.price,
    this.press,
  }) : super(key: key);
  final String foodtitle, image, address, rating, price;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
            height: 126,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23))
                ]),
            child: Padding(
              padding: EdgeInsets.fromLTRB(132, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 150,
                        child: Text(
                          foodtitle,
                          maxLines: 2,
                          style: TextStyle(
                            color: Color(0xff181725),
                            fontFamily: 'Poppins-Medium',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Spacer(),
                      //
                      GestureDetector(
                        onTap: press,
                        child: Icon(
                          Icons.arrow_right,
                          size: 15,
                          color: kPrimaryColor,
                        ),
                      )
                    ],
                  ),
                  Text(
                    address,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xff7C7C7C),
                      fontFamily: 'Poppins-Regular',
                      fontSize: 14,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Color(0xfffbd553),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        rating,
                        style: TextStyle(
                            fontFamily: 'Poppins-Reguler',
                            fontSize: 14,
                            color: Color(0xff7C7C7C)),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      " \$ $price",
                      style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          fontSize: 18,
                          color: Color(0xff53b175)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 20.0,
            top: 10,
            child: Image.asset(
              image,
              width: 120,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
