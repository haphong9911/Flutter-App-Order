import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_orderapp/model/Bestselling.dart';
import 'package:flutter_orderapp/model/Cart_model.dart';
import 'package:flutter_orderapp/model/Featured.dart';
import 'package:flutter_orderapp/model/HomeCategories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_orderapp/model/Usermodel.dart';

class Myprovider with ChangeNotifier {
  List<CategoryModel> categoryModelList = [];
  CategoryModel categoryModel;
  Future<void> getCategoryProduct() async {
    List<CategoryModel> list = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("homecategories").get();
    querySnapshot.docs.forEach((categorydata) {
      categoryModel = CategoryModel(
        image: categorydata.data()["image"],
        name: categorydata.data()["name"],
      );
      list.add(categoryModel);
    });
    categoryModelList = list;
    notifyListeners();
  }

  List<CategoryModel> get getCategoryModelList {
    return categoryModelList;
  }

  List<BestsellingModel> bestsellingModelList = [];
  BestsellingModel bestsellingModel;
  Future<void> getBestselling() async {
    List<BestsellingModel> list = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("homefeature").get();
    querySnapshot.docs.forEach((bestsellingdata) {
      bestsellingModel = BestsellingModel(
        foodSubtitle: bestsellingdata.data()["foodSubtitle"],
        foodTitle: bestsellingdata.data()["foodTitle"],
        image: bestsellingdata.data()["image"],
        price: bestsellingdata.data()["price"],
        rating: bestsellingdata.data()["rating"],
      );
      list.add(bestsellingModel);
    });
    bestsellingModelList = list;
    notifyListeners();
  }

  List<BestsellingModel> get getbestsellingModelList {
    return bestsellingModelList;
  }

  List<FeaturedModel> featuredModelList = [];
  FeaturedModel featuredModel;
  Future<void> getFeatured() async {
    List<FeaturedModel> list = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("featured").get();
    querySnapshot.docs.forEach((featureddata) {
      featuredModel = FeaturedModel(
        description: featureddata.data()["description"],
        foodtitle: featureddata.data()["foodtitle"],
        address: featureddata.data()["address"],
        image: featureddata.data()["image"],
        price: featureddata.data()["price"],
        rating: featureddata.data()["rating"],
      );
      list.add(featuredModel);
    });
    featuredModelList = list;
    notifyListeners();
  }

  List<FeaturedModel> get getfeaturedModelList {
    return featuredModelList;
  }

  // //add to cart//
  // List<CartModel> cartList = [];
  // List<CartModel> newCartList = [];
  // CartModel cartModel;
  // void addtocart({
  //   @required String foodtitle,
  //   @required String image,
  //   @required String address,
  //   @required double price,
  //   @required int quantity,
  // }) {
  //   cartModel = CartModel(
  //       foodtitle: foodtitle,
  //       image: image,
  //       price: price,
  //       quantity: quantity,
  //       address: address);
  //   newCartList.add(cartModel);
  //   cartList = newCartList;
  // }

  // get throwcartList {
  //   return cartList;
  // }

  List<CartModel> cartModelList = <CartModel>[];
  CartModel cartModel;

  void getCartData({
    String foodtitle,
    image,
    address,
    double price,
    int quantity,
  }) {
    cartModel = CartModel(
        foodtitle: foodtitle,
        image: image,
        price: price,
        quantity: quantity,
        address: address);
    cartModelList.add(cartModel);
  }

  List<CartModel> get getCartModelList {
    return List.from(cartModelList ?? []);
  }

  int get getCartModelListlength {
    return cartModelList.length;
  }

  void deleteCartProduct(int index) {
    cartModelList.removeAt(index);
    notifyListeners();
  }

  List<CartModel> checkOutModelList = [];
  CartModel checkOutModel;
  void getCheckOutData({
    String foodtitle,
    image,
    address,
    double price,
    int quantity,
  }) {
    checkOutModel = CartModel(
        foodtitle: foodtitle,
        image: image,
        price: price,
        quantity: quantity,
        address: address);
    checkOutModelList.add(checkOutModel);
  }

  List<CartModel> get getcheckOutModelList {
    return List.from(checkOutModelList ?? []);
  }

  int get getcheckOutModelListlength {
    return checkOutModelList.length;
  }

  void deletegetcheckOutModel(int index) {
    checkOutModelList.removeAt(index);
    notifyListeners();
  }

  void clearCartModelList() {
    cartModelList.clear();
    notifyListeners();
  }

  List<String> notificationList = [];

  void addNotification(String notification) {
    notificationList.add(notification);
  }

  int get getNotificationIndex {
    return notificationList.length;
  }

  get getNotificationList {
    return notificationList;
  }

  List<UserModel> userModelList = [];
  UserModel userModel;
  Future<void> getUserData() async {
    List<UserModel> newList = [];
    User currentUser = FirebaseAuth.instance.currentUser;
    QuerySnapshot userSnapShot =
        await FirebaseFirestore.instance.collection("UserData").get();
    userSnapShot.docs.forEach(
      (element) {
        if (currentUser.uid == element.data()["UserID"]) {
          userModel = UserModel(
              userAddress: element.data()["UserAddress"],
              userImage: element.data()["UserImage"],
              userEmail: element.data()["UserEmail"],
              userGender: element.data()["UserGender"],
              userName: element.data()["UserName"],
              userPhoneNumber: element.data()["UserNumber"]);
          newList.add(userModel);
        }
        userModelList = newList;
      },
    );
  }

  List<UserModel> get getUserModelList {
    return userModelList;
  }
}
