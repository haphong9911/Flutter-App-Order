import 'package:flutter/material.dart';

class CartModel {
  final String image, foodtitle, address, key;
  final double price;
  final int quantity;

  CartModel(
      {@required this.foodtitle,
      this.key,
      @required this.image,
      @required this.price,
      @required this.quantity,
      @required this.address});
}
