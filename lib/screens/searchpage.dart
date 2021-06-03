import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_orderapp/detail/detail_screen.dart';
import 'package:flutter_orderapp/provider/Data_controler.dart';
import 'package:flutter_orderapp/provider/myprovider.dart';
import 'package:flutter_orderapp/screens/homepage.dart';
import 'package:flutter_orderapp/widget/Constand.dart';
import 'package:flutter_orderapp/widget/notification_button.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

Myprovider myprovider;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  QuerySnapshot snapshotData;
  bool isExcecuted = false;
  @override
  Widget build(BuildContext context) {
    myprovider = Provider.of<Myprovider>(context);
    myprovider.getFeatured();
    Widget searchdata() {
      return ListView.builder(
        itemCount: snapshotData.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(snapshotData.docs[index].data()['image']),
            ),
            title: Text(
              snapshotData.docs[index].data()['foodtitle'],
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              snapshotData.docs[index].data()['address'],
              style: TextStyle(
                color: Color(0xff7C7C7C),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => DetailScreen(
                          food: myprovider.getfeaturedModelList[index],
                        ))),
          );
        },
      );
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.clear),
          onPressed: () {
            setState() {
              isExcecuted = false;
            }
          },
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          actions: [
            GetBuilder<DataControler>(
                init: DataControler(),
                builder: (val) {
                  return IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Color(0xff53B175),
                      ),
                      onPressed: () {
                        val.queryData(searchController.text).then((value) {
                          snapshotData = value;
                          setState(() {
                            isExcecuted = true;
                          });
                        });
                      });
                }),
            NotificationButton(),
          ],
          title: TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.black)),
            controller: searchController,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: kPrimaryColor),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => Homepage()));
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: isExcecuted
            ? searchdata()
            : Container(
                child: Center(
                  child: Text(
                    'Search any food',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ));
  }
}
