import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungerzzz/bloc/bloc/cart_bloc.dart';
import 'package:hungerzzz/screens/CartPage.dart';
import 'package:hungerzzz/screens/CheckoutPage.dart';
import 'package:hungerzzz/screens/AddressPage.dart';
import 'package:hungerzzz/shared/consts.dart';
// import 'package:hungerzzz/screens/ProductPage.dart';
import 'package:hungerzzz/widgets/ProductCardHome.dart';
// import 'package:hungerzzz/widgets/productCardHome.dart';
// import 'package:hungerzzz/widgets/productCardHomeHome.dart';

import 'StorePage.dart';
// import 'dart:math' as math;

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
         GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: h(context) / 4,
                decoration: BoxDecoration(
                  color: yellow,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 80,
                      padding: EdgeInsets.all(30),
                      // margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 4),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/veg.jpg"),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter)),
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("John Doe",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )),
                        Text("@john_doe12",
                            style: TextStyle(color: Colors.black87))
                      ],
                    )
                  ],
                )),
            Container(
                height: (h(context) - h(context) / 4) - 60,
                child: ListView(
                  children: <Widget>[
                    navButton(
                        iconData: Icons.shopping_basket, title: "My Orders"),
                    navButton(iconData: Icons.favorite, title: "Wishlist"),
                    navButton(iconData: Icons.history, title: "Order History"),
                    navButton(
                        iconData: Icons.notifications, title: "Notification"),
                    navButton(iconData: Icons.card_giftcard, title: "Offers"),
                    navButton(iconData: Icons.share, title: "Share"),
                    navButton(iconData: Icons.star, title: "Rate Our App"),
                    navButton(iconData: Icons.feedback, title: "Feedback"),
                    navButton(iconData: Icons.info, title: "About"),
                  ],
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          width: w(context),
          height: h(context),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                top: h(context) * .1,
                child: Container(
                  width: w(context),
                  height: h(context),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StorePage())),
                          child: _banner(context)),
                      SizedBox(height: 20),
                      Container(
                        width: w(context),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.dstATop),
                                image:
                                    AssetImage("assets/images/groceries.jpg"),
                                fit: BoxFit.cover),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "SHOP BY CATEGORY",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // SizedBox(height: 10),
                      Container(
                        width: w(context),
                        // margin: EdgeInsets.symmetric(horizontal: 10),
                        height: h(context) * .48,
                        child: GridView.count(
                          crossAxisCount: 2,
                          scrollDirection: Axis.vertical,
                          mainAxisSpacing: 10,
                          padding: EdgeInsets.all(10),
                          crossAxisSpacing: 10,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          childAspectRatio: 5 / 2,
                          children: <Widget>[
                            _foodCat(
                                context: context,
                                catImage: "assets/images/fast_food.jpg",
                                catName: "FAST FOODS"),
                            _foodCat(
                                context: context,
                                catImage: "assets/images/ice_cream.jpg",
                                catName: "ICE CREAM"),
                            _foodCat(
                                context: context,
                                catImage: "assets/images/bevereges.jpg",
                                catName: "BEVEREGES"),
                            _foodCat(
                                context: context,
                                catImage: "assets/images/meat.jpg",
                                catName: "FISH & MEAT"),
                            _foodCat(
                                context: context,
                                catImage: "assets/images/snacks.jpg",
                                catName: "SNACKS"),
                            _foodCat(
                                context: context,
                                catImage: "assets/images/groceries.jpg",
                                catName: "GROCERIES"),
                            _foodCat(
                                context: context,
                                catImage: "assets/images/veg.jpg",
                                catName: "FRUITS & VEGS"),
                          ],
                        ),
                      ),
                      productHeader(
                          context: context,
                          productHeader: "POPULAR",
                          bgImage: "assets/images/bevereges.jpg",
                          onPress: () => print("POPULAR")),
                      SizedBox(height: 10),
                      Container(
                        width: w(context),
                        // margin: EdgeInsets.symmetric(horizontal: 10),
                        height: h(context) / 4.2,
                        child: ListView(
                          shrinkWrap: true,

                          // crossAxisCount: 1,
                          scrollDirection: Axis.horizontal,
                          // mainAxisSpacing: 10,
                          // padding: EdgeInsets.all(10),
                          // crossAxisSpacing: 10,
                          // shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          // childAspectRatio: 3 / 2,
                          children: <Widget>[
                            productCardHome(
                                context: context,
                                productImage: "assets/images/fast_food.jpg",
                                mPrice: 100,
                                discount: 10,
                                isFav: false,
                                productTitle: "VANILLA ICE CREAM1",
                                shopAddress:
                                    "Radiant Food Palace,Station Road"),
                            productCardHome(
                                context: context,
                                productImage: "assets/images/groceries.jpg",
                                mPrice: 100,
                                discount: 10,
                                isFav: false,
                                productTitle: "VANILLA ICE CREAM2",
                                shopAddress:
                                    "Radiant Food Palace,Station Road"),
                            productCardHome(
                                context: context,
                                productImage: "assets/images/meat.jpg",
                                mPrice: 100,
                                discount: 10,
                                isFav: false,
                                productTitle: "VANILLA ICE CREAM3",
                                shopAddress:
                                    "Radiant Food Palace,Station Road"),
                            productCardHome(
                                context: context,
                                productImage: "assets/images/bevereges.jpg",
                                mPrice: 100,
                                discount: 10,
                                isFav: false,
                                productTitle: "VANILLA ICE CREAM4",
                                shopAddress:
                                    "Radiant Food Palace,Station Road"),
                            productCardHome(
                                context: context,
                                productImage: "assets/images/ice_cream.jpg",
                                mPrice: 100,
                                discount: 10,
                                isFav: false,
                                productTitle: "VANILLA ICE CREAM5",
                                shopAddress:
                                    "Radiant Food Palace,Station Road"),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      productHeader(
                          context: context,
                          productHeader: "BEST SELLING",
                          bgImage: "assets/images/veg.jpg",
                          onPress: () => Navigator.pushNamed(context,AddressPage.id)),
                      SizedBox(height: 10),
                      Container(
                        width: w(context),
                        // margin: EdgeInsets.symmetric(horizontal: 10),
                        height: h(context) / 4.2,
                        child: ListView(
                          shrinkWrap: true,

                          // crossAxisCount: 1,
                          scrollDirection: Axis.horizontal,
                          // mainAxisSpacing: 10,
                          // padding: EdgeInsets.all(10),
                          // crossAxisSpacing: 10,
                          // shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          // childAspectRatio: 3 / 2,
                          children: <Widget>[
                            productCardHome(
                                context: context,
                                productImage: "assets/images/fast_food.jpg",
                                mPrice: 100,
                                discount: 10,
                                isFav: false,
                                productTitle: "VANILLA ICE CREAM6",
                                shopAddress:
                                    "Radiant Food Palace,Station Road"),
                            productCardHome(
                                context: context,
                                productImage: "assets/images/groceries.jpg",
                                mPrice: 100,
                                discount: 10,
                                isFav: false,
                                productTitle: "VANILLA ICE CREAM7",
                                shopAddress:
                                    "Radiant Food Palace,Station Road"),
                            productCardHome(
                                context: context,
                                productImage: "assets/images/meat.jpg",
                                mPrice: 100,
                                discount: 10,
                                isFav: false,
                                productTitle: "VANILLA ICE CREAM8",
                                shopAddress:
                                    "Radiant Food Palace,Station Road"),
                            productCardHome(
                                context: context,
                                productImage: "assets/images/bevereges.jpg",
                                mPrice: 100,
                                discount: 10,
                                isFav: false,
                                productTitle: "VANILLA ICE CREAM9",
                                shopAddress:
                                    "Radiant Food Palace,Station Road"),
                            productCardHome(
                                context: context,
                                productImage: "assets/images/ice_cream.jpg",
                                mPrice: 100,
                                discount: 10,
                                isFav: false,
                                productTitle: "VANILLA ICE CREAM10",
                                shopAddress:
                                    "Radiant Food Palace,Station Road"),
                          ],
                        ),
                      ),
                      SizedBox(height: 200)
                    ],
                  ),
                ),
              ),
            //   BlocListener<CartBloc, CartState>(
            // listener: (context, state) {},
            // child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            //   if (state is CartInitial) {
            //   return _appBar(context, () => _scaffoldKey.currentState.openDrawer());
            //   }

            // }
            // )),
_appBar(context, () => _scaffoldKey.currentState.openDrawer()),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: w(context),
                  height: h(context) * 0.07,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, -5),
                          blurRadius: 30,
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, AddressPage.id),
                          child: _bottomNavButton(iconData: Icons.search)),
                      _bottomNavButton(iconData: Icons.favorite_border)
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () => {},
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 3, color: Colors.white),
                      color: Colors.black,
                    ),
                    child: Icon(
                      Icons.home,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container navButton({bool isActive, String title, IconData iconData}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),

      // height: 40,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(.9),
          border: Border(bottom: BorderSide(width: .5, color: yellow))),
      child: InkWell(
        onTap: () => {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              color: yellow,
              size: 25,
            ),
            // Spacer(),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }

  // InkWell _productCardHome(
  //     {BuildContext context,
  //     String productImage,
  //     double mPrice,
  //     int discount,
  //     String shopAddress,
  //     String productTitle,
  //     bool isFav}) {
  //   int price = ((mPrice / 100) * discount).floor();
  //   return InkWell(
  //     onTap: () => Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => ProductPage())),
  //     child: Container(
  //       margin: EdgeInsets.only(top: 10, left: 10, right: 10),
  //       width: w(context) / 3,
  //       height: h(context) / 3.5,
  //       decoration: BoxDecoration(
  //           color: yellow,
  //           borderRadius: BorderRadius.circular(20),
  //           boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2))]),
  //       child: Stack(
  //         alignment: Alignment.topCenter,
  //         children: <Widget>[
  //           Container(
  //             height: h(context) * .18,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //               color: Colors.black,
  //               image: DecorationImage(
  //                   colorFilter: ColorFilter.mode(
  //                       Colors.black.withOpacity(0.7), BlendMode.dstATop),
  //                   image: AssetImage(productImage),
  //                   fit: BoxFit.cover),
  //             ),
  //           ),
  //           Positioned(
  //               top: 10,
  //               child: Container(
  //                 padding: EdgeInsets.symmetric(horizontal: 20),
  //                 width: w(context),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: <Widget>[
  //                     FlatButton(
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(10.0),
  //                         // side: BorderSide(color: Colors.red)
  //                       ),
  //                       onPressed: () => {},
  //                       child: Text(
  //                         "$discount% OFF",
  //                         style: TextStyle(
  //                           color: Colors.black,
  //                           fontSize: 15,
  //                         ),
  //                       ),
  //                       color: yellow,
  //                     ),
  //                     IconButton(
  //                         icon: !isFav
  //                             ? Icon(
  //                                 Icons.favorite_border,
  //                                 color: Colors.white,
  //                               )
  //                             : Icon(
  //                                 Icons.favorite,
  //                                 color: yellow,
  //                               ),
  //                         onPressed: () => {})
  //                   ],
  //                 ),
  //               )),
  //           Positioned(
  //               right: 30,
  //               bottom: h(context) * 0.070,
  //               child: Container(
  //                 padding: EdgeInsets.all(20),
  //                 decoration: BoxDecoration(
  //                     color: Colors.white,
  //                     boxShadow: [
  //                       BoxShadow(color: Colors.black.withOpacity(.5))
  //                     ],
  //                     shape: BoxShape.circle),
  //                 child: Align(
  //                     child: Text(
  //                   "₹$price",
  //                   style: TextStyle(fontSize: 18),
  //                 )),
  //               )),
  //           Positioned(
  //               left: 10,
  //               bottom: h(context) * 0.03,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: <Widget>[
  //                   Text(
  //                     productTitle,
  //                     style: TextStyle(fontSize: 18),
  //                   ),
  //                   SizedBox(
  //                     height: 1,
  //                   ),
  //                   Text(shopAddress,
  //                       style: TextStyle(
  //                           color: Colors.black87.withOpacity(.7),
  //                           fontSize: 15))
  //                 ],
  //               ))
  //         ],
  //       ),
  //     ),
  //   );
  // }
  // InkWell _productCardHome(
  //     {BuildContext context,
  //     String productImage,
  //     double mPrice,
  //     int discount,
  //     String shopAddress,
  //     String productTitle,
  //     bool isFav}) {
  //   int price = ((mPrice / 100) * discount).floor();
  //   return InkWell(
  //     onTap: () => Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => ProductPage())),
  //     child: Container(
  //       width: w(context) / 3,
  //       height: h(context) * .01,
  //       decoration: BoxDecoration(
  //           color: yellow,
  //           borderRadius: BorderRadius.circular(20),
  //           boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2))]),
  //       child: Stack(
  //         alignment: Alignment.topCenter,
  //         children: <Widget>[
  //           Container(
  //             height: h(context) * .22,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //               color: Colors.black,
  //               image: DecorationImage(
  //                   colorFilter: ColorFilter.mode(
  //                       Colors.black.withOpacity(0.7), BlendMode.dstATop),
  //                   image: AssetImage(productImage),
  //                   fit: BoxFit.cover),
  //             ),
  //           ),
  //           Positioned(
  //               top: 10,
  //               child: Container(
  //                 padding: EdgeInsets.symmetric(horizontal: 20),
  //                 width: w(context),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: <Widget>[
  //                     FlatButton(
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(10.0),
  //                         // side: BorderSide(color: Colors.red)
  //                       ),
  //                       onPressed: () => {},
  //                       child: Text(
  //                         "$discount% OFF",
  //                         style: TextStyle(
  //                           color: Colors.black,
  //                           fontSize: 15,
  //                         ),
  //                       ),
  //                       color: yellow,
  //                     ),
  //                     IconButton(
  //                         icon: !isFav
  //                             ? Icon(
  //                                 Icons.favorite_border,
  //                                 color: Colors.white,
  //                               )
  //                             : Icon(
  //                                 Icons.favorite,
  //                                 color: yellow,
  //                               ),
  //                         onPressed: () => {})
  //                   ],
  //                 ),
  //               )),
  //           Positioned(
  //               right: 30,
  //               bottom: h(context) * 0.075,
  //               child: Container(
  //                 padding: EdgeInsets.all(20),
  //                 decoration: BoxDecoration(
  //                     color: Colors.white,
  //                     boxShadow: [
  //                       BoxShadow(color: Colors.black.withOpacity(.5))
  //                     ],
  //                     shape: BoxShape.circle),
  //                 child: Align(
  //                     child: Text(
  //                   "₹$price",
  //                   style: TextStyle(fontSize: 18),
  //                 )),
  //               )),
  //           Positioned(
  //               left: 10,
  //               bottom: h(context) * 0.03,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: <Widget>[
  //                   Text(
  //                     productTitle,
  //                     style: TextStyle(fontSize: 18),
  //                   ),
  //                   SizedBox(
  //                     height: 1,
  //                   ),
  //                   Text(shopAddress,
  //                       style: TextStyle(
  //                           color: Colors.black87.withOpacity(.7),
  //                           fontSize: 15))
  //                 ],
  //               ))
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Container productHeader(
      {BuildContext context,
      String productHeader,
      String bgImage,
      VoidCallback onPress}) {
    return Container(
      width: w(context),
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          // image: DecorationImage(
          //     colorFilter: new ColorFilter.mode(
          //         Colors.black.withOpacity(0.5), BlendMode.dstATop),
          //     image: AssetImage(bgImage),
          //     fit: BoxFit.cover),
          color: Colors.black,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            productHeader,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              // side: BorderSide(color: Colors.red)
            ),
            onPressed: onPress,
            child: Text(
              "SEE ALL",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            color: yellow,
          )
        ],
      ),
    );
  }

  Container _foodCat({BuildContext context, String catName, String catImage}) {
    return Container(
        // margin: EdgeInsets.only(left: 10),
        // height: 10,
        // width: w(context) / 2.5,
        // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  offset: Offset(0, 2),
                  blurRadius: 2)
            ],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: yellow, width: 2),
            image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.dstATop),
                image: AssetImage(catImage),
                fit: BoxFit.cover),
            color: Colors.black),
        child: Align(
            alignment: Alignment.center,
            child: Text(
              catName,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            )));
  }

  Container _banner(BuildContext context) {
    return Container(
      width: w(context),
      height: h(context) * 0.2,
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: yellow),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage("assets/images/banner.png"),
              fit: BoxFit.cover)),
    );
  }

  GestureDetector _bottomNavButton({
    IconData iconData,
  }) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(.2),
        ),
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
  }

  Positioned _appBar(BuildContext context, VoidCallback onPress) {
    return Positioned(
      top: 25,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: w(context),
        height: h(context) * 0.08,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 30,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black87,
                ),
                onPressed: onPress),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, CheckoutPage.id),
              child: Row(
                children: <Widget>[
                  Icon(Icons.map),
                  SizedBox(width: 10),
                  Text(
                    "Kokrajhar,781325",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.black87,
                    ),
                    onPressed: () => Navigator.pushNamed(context, CartPage.id)),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: yellow,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.0)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "105",
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
