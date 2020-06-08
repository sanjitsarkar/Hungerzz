import 'package:flutter/material.dart';
import 'package:hungerzzz/screens/ProductPage.dart';
import 'package:hungerzzz/shared/consts.dart';

InkWell productCardStore(
    {BuildContext context,
    String productImage,
    double mPrice,
    int discount,
    String shopAddress,
    String productTitle,
    bool isFav}) {
  int price = ((mPrice / 100) * discount).floor();
  return InkWell(
    onTap: () => Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProductPage())),
    child: Container(
      margin: EdgeInsets.only(top: 15, left: 10, right: 10),
      width: w(context),
      height: h(context) / 5,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2))]),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            height: h(context) / 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Colors.black,
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.dstATop),
                  image: AssetImage(productImage),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
              top: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: w(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        // side: BorderSide(color: Colors.red)
                      ),
                      onPressed: () => {},
                      child: Text(
                        "$discount% OFF",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      color: yellow,
                    ),
                    IconButton(
                        icon: !isFav
                            ? Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.favorite,
                                color: yellow,
                              ),
                        onPressed: () => {})
                  ],
                ),
              )),
          Positioned(
              right: 30,
              top: h(context) / 7 - 20,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(.5))],
                    shape: BoxShape.circle),
                child: Align(
                    child: Text(
                  "₹$price",
                  style: TextStyle(fontSize: 18),
                )),
              )),
          Positioned(
              left: 15,
              bottom: 13,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    productTitle,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ))
        ],
      ),
    ),
  );
}
