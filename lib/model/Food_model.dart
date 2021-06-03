import 'package:flutter/material.dart';

class Food {
  final String image, foodtitle, address, rating, price, description;
  final int id;
  final Color color;
  Food({
    this.price,
    this.image,
    this.foodtitle,
    this.address,
    this.rating,
    this.color,
    this.id,
    this.description,
  });
}

List<Food> foods = [
  Food(
      id: 1,
      foodtitle: "BBQ Pork Sandwich",
      image: "images/11.png",
      address: "DaNang Hotel",
      price: "4.99",
      rating: "4.5",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
  Food(
      id: 2,
      foodtitle: "Classic Pizza",
      image: "images/14.png",
      address: "SaiGon Hotel",
      rating: "4.0",
      price: "4.99",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
  Food(
      id: 3,
      foodtitle: "Pumpkin Soup",
      image: "images/10.png",
      address: "American Hotel",
      rating: "3.5",
      price: "4.99",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
  Food(
      id: 4,
      foodtitle: "Salads",
      image: "images/12.png",
      address: "NhaTrang Hotel",
      rating: "4.5",
      price: "4.99",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
  Food(
      id: 5,
      foodtitle: "Salmon Carpaccio",
      image: "images/17.png",
      address: "Hue Hotel",
      rating: "4.5",
      price: "4.99",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
  Food(
      id: 6,
      foodtitle: "Steak Dry-aged Ribeye",
      image: "images/15.png",
      address: "Hello Hotel",
      rating: "5.0",
      price: "4.99",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
  Food(
      id: 7,
      foodtitle: "StrawberyCake",
      image: "images/13.png",
      address: "SunWheel Hotel",
      rating: "2.5",
      price: "4.99",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
  Food(
      id: 8,
      foodtitle: "Sushi",
      image: "images/14.png",
      address: "TenTen Hotel",
      rating: "3.5",
      price: "4.99",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ")
];
