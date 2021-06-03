import 'package:flutter/material.dart';
import 'package:flutter_orderapp/provider/myprovider.dart';
import 'package:flutter_orderapp/widget/Constand.dart';
import 'package:provider/provider.dart';

Myprovider myprovider;

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    myprovider = Provider.of<Myprovider>(context);
    myprovider.getCategoryProduct();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, //No more green
        elevation: 0.0, //Shadow gone
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kPrimaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Categories",
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
                itemCount: myprovider.categoryModelList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.95,
                    mainAxisSpacing: kDefaultPadding,
                    crossAxisSpacing: kDefaultPadding / 2),
                itemBuilder: (ctx, index) => ItemCard(
                  title: myprovider.getCategoryModelList[index].name,
                  image: myprovider.getCategoryModelList[index].image,
                  press: () {},
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Function press;
  final String title, image;
  const ItemCard({Key key, this.press, this.image, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      // height: 190.0,
      // width: 175.0,
      decoration: BoxDecoration(
          color: Color.fromRGBO(83, 177, 177, 0.1),
          border: Border.all(color: Color.fromRGBO(83, 177, 117, 0.7)),
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            // padding: EdgeInsets.only(top: kDefaultPadding),
            height: 100,
            width: 100,
            child: Image.network(image),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff181725)),
          )
        ],
      ),
    );
  }
}
