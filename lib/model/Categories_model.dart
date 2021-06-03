import 'package:flutter/material.dart';

class Category {
  final String image, title;
  final int id;
  final Color color;
  Category({
    this.image,
    this.title,
    this.color,
    this.id,
  });
}

List<Category> categories = [
  Category(id: 1, title: "Pizza", image: "images/pizza.png"),
  Category(id: 2, title: "Salad", image: "images/Salads.png"),
  Category(id: 3, title: "Chicken", image: "images/Chicken.png"),
  Category(id: 4, title: "Burger", image: "images/Hamberger.png"),
  Category(id: 5, title: "Rice", image: "images/Rice.png"),
  Category(id: 6, title: "Beverages", image: "images/16.png"),
  Category(id: 7, title: "Cake", image: "images/18.png"),
  Category(id: 8, title: "Sushi", image: "images/19.png")
];
