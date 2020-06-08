import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hungerzzz/screens/ProductPage.dart';
import 'package:hungerzzz/shared/consts.dart';
import 'package:hungerzzz/widgets/ProductCardStore.dart';
// import 'package:hungerzzz/widgets/productCardStore.dart';

class StorePage extends StatefulWidget {
  StorePage({Key key}) : super(key: key);
  static String id = "StorePage";
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> with TickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller = TabController(length: 2, vsync: this);
    // _controller = DefaultTabController(length: 3, child: null)
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: w(context),
      height: h(context),
      child: ListView(
        children: <Widget>[
          Container(
            width: w(context),
            padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
            height: h(context) / 3,
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.dstATop),
                    image: AssetImage("assets/images/ice_cream.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {},
                      child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            overflow: Overflow.visible,
                            alignment: Alignment.topRight,
                            children: <Widget>[
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.black87,
                                size: 25,
                              ),
                              Positioned(
                                top: -10,
                                right: -10,
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      color: yellow,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 1.0)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "105",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
                Spacer(),
                Container(
                  alignment: Alignment.bottomRight,
                  // width: w(context),
                  // height: h(context) / 4,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Munna Fast Food Centre",
                          style: TextStyle(
                            color: yellow,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Fast Food",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("3.5",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                RatingBar(
                                  initialRating: 3.5,
                                  minRating: .5,
                                  itemSize: 20,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 1.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    size: 3,
                                    color: yellow,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                )
                              ],
                            )
                          ]),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          Text("KOKRAJHAR",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.7),
                                  fontSize: 20))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: yellow,
            ),
            child: TabBar(
              labelPadding: EdgeInsets.all(10),
              unselectedLabelColor: Colors.black87,
              labelStyle: TextStyle(color: Colors.white, fontSize: 20),
              indicatorColor: Colors.black,
              indicatorWeight: 3,
              isScrollable: true,
              unselectedLabelStyle: TextStyle(color: yellow, fontSize: 18),
              labelColor: Colors.black,
              controller: _controller,
              tabs: [
                Tab(
                  // icon: const Icon(Icons.home),
                  text: 'Pizza',
                ),
                Tab(
                  // icon: const Icon(Icons.my_location),
                  text: 'Pasta',
                ),
                // Tab(
                //   // icon: const Icon(Icons.my_location),
                //   text: 'Burger',
                // ),
                // Tab(
                //   // icon: const Icon(Icons.my_location),
                //   text: 'Sandwich',
                // ),
                // Tab(
                //   // icon: const Icon(Icons.my_location),
                //   text: 'Chicken Roll',
                // ),
              ],
            ),
          ),
          Container(
            height: h(context) / 1.8,
            // margin: EdgeInsets.only(bottom: 40),
            width: w(context),
            decoration: BoxDecoration(color: Colors.white),
            child: TabBarView(
              physics: ScrollPhysics(),
              controller: _controller,
              children: <Widget>[
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    productCardStore(
                        context: context,
                        productImage: "assets/images/fast_food.jpg",
                        mPrice: 100,
                        discount: 10,
                        isFav: false,
                        productTitle: "VANILLA ICE CREAM11",
                        shopAddress: "Radiant Food Palace,Station Road"),
                    productCardStore(
                        context: context,
                        productImage: "assets/images/groceries.jpg",
                        mPrice: 100,
                        discount: 10,
                        isFav: false,
                        productTitle: "VANILLA ICE CREAM12",
                        shopAddress: "Radiant Food Palace,Station Road"),
                    productCardStore(
                        context: context,
                        productImage: "assets/images/meat.jpg",
                        mPrice: 100,
                        discount: 10,
                        isFav: false,
                        productTitle: "VANILLA ICE CREAM13",
                        shopAddress: "Radiant Food Palace,Station Road"),
                    productCardStore(
                        context: context,
                        productImage: "assets/images/bevereges.jpg",
                        mPrice: 100,
                        discount: 10,
                        isFav: false,
                        productTitle: "VANILLA ICE CREAM14",
                        shopAddress: "Radiant Food Palace,Station Road")
                  ],
                ),
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    productCardStore(
                        context: context,
                        productImage: "assets/images/ice_cream.jpg",
                        mPrice: 100,
                        discount: 10,
                        isFav: false,
                        productTitle: "VANILLA ICE CREAM15",
                        shopAddress: "Radiant Food Palace,Station Road"),
                    productCardStore(
                        context: context,
                        productImage: "assets/images/snacks.jpg",
                        mPrice: 100,
                        discount: 10,
                        isFav: false,
                        productTitle: "VANILLA ICE CREAM16",
                        shopAddress: "Radiant Food Palace,Station Road"),
                    productCardStore(
                        context: context,
                        productImage: "assets/images/veg.jpg",
                        mPrice: 100,
                        discount: 10,
                        isFav: false,
                        productTitle: "VANILLA ICE CREAM17",
                        shopAddress: "Radiant Food Palace,Station Road"),
                    productCardStore(
                        context: context,
                        productImage: "assets/images/fast_food.jpg",
                        mPrice: 100,
                        discount: 10,
                        isFav: false,
                        productTitle: "VANILLA ICE CREAM18",
                        shopAddress: "Radiant Food Palace,Station Road")
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
