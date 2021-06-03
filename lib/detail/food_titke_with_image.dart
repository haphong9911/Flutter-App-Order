import 'package:flutter/material.dart';
import 'package:flutter_orderapp/model/Cart_model.dart';
import 'package:flutter_orderapp/model/Featured.dart';
import 'package:flutter_orderapp/model/Food_model.dart';
import 'package:flutter_orderapp/provider/myprovider.dart';
import 'package:flutter_orderapp/screens/CartScreen.dart';
import 'package:flutter_orderapp/widget/Constand.dart';
import 'package:provider/provider.dart';

Myprovider myprovider;

class FoodTitleWithImage extends StatelessWidget {
  const FoodTitleWithImage({
    Key key,
    @required this.food,
  }) : super(key: key);

  final FeaturedModel food;

  @override
  Widget build(BuildContext context) {
    myprovider = Provider.of<Myprovider>(context);
    myprovider.getFeatured();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(food.foodtitle,
              maxLines: 2,
              style: Theme.of(context).textTheme.headline5.copyWith(
                  color: Colors.white,
                  fontFamily: "Poppins-Medium",
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 7,
          ),
          Text(
            food.address,
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
                    text: "\$${food.price}",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold))
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
                          food.image,
                        ),
                        fit: BoxFit.cover),
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
