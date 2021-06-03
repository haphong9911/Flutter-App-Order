import 'package:flutter/material.dart';
import 'package:flutter_orderapp/detail/detail_screen.dart';
import 'package:flutter_orderapp/provider/myprovider.dart';
import 'package:flutter_orderapp/widget/Constand.dart';
import 'package:provider/provider.dart';

Myprovider myprovider;

class BestSelling extends StatelessWidget {
  const BestSelling({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    myprovider = Provider.of<Myprovider>(context);
    myprovider.getFeatured();
    myprovider.getBestselling();
    return SingleChildScrollView(
      child: Container(
        height: 260,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: myprovider.bestsellingModelList.length,
          itemBuilder: (ctx, index) => BestSellerCard(
            foodtitle: myprovider.getbestsellingModelList[index].foodTitle,
            image: myprovider.getbestsellingModelList[index].image,
            address: myprovider.getbestsellingModelList[index].foodSubtitle,
            price: myprovider.getbestsellingModelList[index].price,
            rating: myprovider.getbestsellingModelList[index].rating,
            press: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => DetailScreen(
                          food: myprovider.getfeaturedModelList[index],
                        ))),
          ),
        ),
      ),
    );
  }
}

class BestSellerCard extends StatelessWidget {
  const BestSellerCard({
    Key key,
    this.image,
    this.foodtitle,
    this.address,
    this.rating,
    this.price,
    this.press,
  }) : super(key: key);
  final String image, foodtitle, address, rating, price;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding / 2,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 0.25,
      ),
      child: GestureDetector(
        onTap: press,
        child: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Container(
              height: 250.0,
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
                      height: 230.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffE2E2E2)),
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      child: Container(
                        padding: EdgeInsets.only(top: 120, left: 10, right: 10),
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
                                    " $rating Reactings",
                                    style: TextStyle(
                                        fontFamily: 'Poppins-Reguler',
                                        fontSize: 10,
                                        color: Color(0xff7C7C7C)),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    " \$ $price",
                                    style: TextStyle(
                                        fontFamily: 'Poppins-Medium',
                                        fontSize: 18,
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
                width: 120,
                height: 120,
                decoration: ShapeDecoration(
                    shadows: [
                      BoxShadow(
                          offset: Offset(0, 20),
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
    );
  }
}
