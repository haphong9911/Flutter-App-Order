import 'package:flutter/material.dart';

class FeaturedModel {
  final String foodtitle, image, address, rating, description;
  final double price;
  FeaturedModel({
    @required this.description,
    @required this.foodtitle,
    @required this.address,
    @required this.image,
    @required this.price,
    @required this.rating,
  });
}
