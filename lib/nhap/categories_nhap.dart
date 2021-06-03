import 'package:flutter/material.dart';
import 'package:flutter_orderapp/detail/detail_screen.dart';
import 'package:flutter_orderapp/model/Featured.dart';
import 'package:flutter_orderapp/model/Food_model.dart';
import 'package:flutter_orderapp/provider/myprovider.dart';
import 'package:flutter_orderapp/screens/homepage.dart';
import 'package:flutter_orderapp/widget/Constand.dart';
import 'package:provider/provider.dart';

Myprovider myprovider;

class Foods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    myprovider = Provider.of<Myprovider>(context);
    myprovider.getFeatured();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, //No more green
        elevation: 0.0, //Shadow gone
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kPrimaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Food",
          style: TextStyle(
              fontFamily: 'Poppins-Medium', fontSize: 18, color: kPrimaryColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                  color: Color(0xffF2F3F2),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 40,
                      color: kPrimaryColor.withOpacity(0.2),
                    )
                  ]),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search.....",
                          hintStyle: TextStyle(
                            color: Color(0xff9E9E9E),
                            fontSize: 14.0,
                            fontFamily: 'Poppins-Regular',
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: kPrimaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: GridView.builder(
                itemCount: myprovider.featuredModelList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.73,
                  // mainAxisSpacing: kDefaultPadding,
                  // crossAxisSpacing: kDefaultPadding / 2
                ),
                itemBuilder: (context, index) => ItemCard(
                  foodtitle: myprovider.getfeaturedModelList[index].foodtitle,
                  image: myprovider.getfeaturedModelList[index].image,
                  rating: myprovider.getfeaturedModelList[index].rating,
                  address: myprovider.getfeaturedModelList[index].address,
                  price: myprovider.getfeaturedModelList[index].price,
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => DetailScreen(
                                food: myprovider.getfeaturedModelList[index],
                              ))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final FeaturedModel food;
  final String foodtitle, address, image, rating;
  final double price;
  final Function press;
  const ItemCard({
    Key key,
    this.food,
    this.address,
    this.foodtitle,
    this.image,
    this.price,
    this.rating,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.only(
          left: kDefaultPadding / 2,
          right: 0,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding * 0.25,
        ),
        child: GestureDetector(
          onTap: press,
          child: Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Container(
                height: 270.0,
                width: 200.0,
                decoration: BoxDecoration(
                    // color: Colors.blueGrey,
                    // border: Border.all(color: Color(0xffE2E2E2)),
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 15),
                      child: Container(
                        height: 220.0,
                        width: 170.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(83, 177, 117, 0.7)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(18))),
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 120, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                foodtitle,
                                style: TextStyle(
                                    color: Color(0xff181725),
                                    fontFamily: 'Poppins-Medium',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3,
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
                              Container(
                                child: Row(
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
                                      rating + " Reacting",
                                      style: TextStyle(
                                          fontFamily: 'Poppins-Reguler',
                                          fontSize: 10,
                                          color: Color(0xff7C7C7C)),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "$price",
                                      style: TextStyle(
                                          fontFamily: 'Poppins-Medium',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff53b175)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  decoration: ShapeDecoration(
                      shadows: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: kPrimaryColor.withOpacity(0.23))
                      ],
                      shape: CircleBorder(
                          side: BorderSide(
                        width: 2,
                        color: kPrimaryColor,
                      ))),
                  child: CircleAvatar(
                    maxRadius: 55,
                    backgroundImage: NetworkImage(
                      image,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
