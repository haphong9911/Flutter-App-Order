import 'package:flutter/material.dart';
import 'package:flutter_orderapp/model/Cart_model.dart';

class OrderItem {
  final String id;
  final List<CartModel> product;
  final double totalprice;
  final DateTime dateTime;
  OrderItem({
    @required this.dateTime,
    @required this.product,
    @required this.totalprice,
    @required this.id,
  });
}

class Oder with ChangeNotifier {
  List<OrderItem> _order = [];

  List<OrderItem> get order {
    return [..._order];
  }
}
