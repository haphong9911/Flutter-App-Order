import 'package:flutter/material.dart';
import 'package:flutter_orderapp/provider/myprovider.dart';
import 'package:flutter_orderapp/widget/Constand.dart';
import 'package:provider/provider.dart';

Myprovider myprovider;

class ListCategories extends StatelessWidget {
  const ListCategories({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    myprovider = Provider.of<Myprovider>(context);
    myprovider.getCategoryProduct();
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: myprovider.categoryModelList.length,
        itemBuilder: (ctx, index) => CategoriesCard(
          title: myprovider.getCategoryModelList[index].name,
          image: myprovider.getCategoryModelList[index].image,
          press: () {},
        ),
      ),
    );
  }
}

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    Key key,
    this.image,
    this.title,
    this.press,
  }) : super(key: key);
  final String image, title;
  final Function press;
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 0.25,
      ),
      // width: size.width * 0.4,
      child: GestureDetector(
        onTap: press,
        child: Stack(
          children: <Widget>[
            Container(
              height: 140.0,
              width: 130.0,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffE2E2E2)),
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: kDefaultPadding),
                    height: 80,
                    width: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff181725)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
