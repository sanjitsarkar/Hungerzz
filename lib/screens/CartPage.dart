import 'package:flutter/material.dart';
import 'package:hungerzzz/bloc/bloc/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungerzzz/shared/consts.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);
  static String id = "CartPage";
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actionsIconTheme: IconThemeData(color: Colors.red),
          primary: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context)),
          elevation: 1,
          title: Text("Cart", style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: BlocListener<CartBloc, CartState>(
            listener: (context, state) {},
            child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              if (state is CartLoaded) {
                if(state.products.length==0)
                {
                  return Center(child: 
                  
                  Text("Nothing is added to cart..."),);
                }
                return Container(
                  width: w(context),
                  height: h(context),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: w(context),
                        height: h(context) / 2.5,
                        child: ListView.builder(
                          itemCount: state.products.length,
                          scrollDirection: Axis.vertical,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            return cartList(context: context,
                            discount: state.products[index].discount.toDouble(),
                            mPrice: state.products[index].productMPrice.toDouble()*state.products[index].productQuantity,
                            productImg: state.products[index].productImage,
                            productName: state.products[index].productName,
                            quantity: state.products[index].productQuantity,
                            productId: state.products[index].productId
                            );
                          },
                          // children: <Widget>[
                          //   cartList(
                          //       context: context,
                          //       productName: "Baked Potatoes",
                          //       productImg: "assets/images/veg.jpg",
                          //       mPrice: 80,
                          //       discount: 2,
                          //       quantity: 1),
                          //   cartList(
                          //       context: context,
                          //       productName: "Fried Chips",
                          //       productImg: "assets/images/snacks.jpg",
                          //       mPrice: 80,
                          //       discount: 2,
                          //       quantity: 1),
                          //   cartList(
                          //       context: context,
                          //       productName: "Vanilla Ice Cream",
                          //       productImg: "assets/images/ice_cream.jpg",
                          //       mPrice: 80,
                          //       discount: 2,
                          //       quantity: 1),
                          //   cartList(
                          //       context: context,
                          //       productName: "Vanilla Ice Cream",
                          //       productImg: "assets/images/groceries.jpg",
                          //       mPrice: 80,
                          //       discount: 2,
                          //       quantity: 1),
                          //   cartList(
                          //       context: context,
                          //       productName: "Vanilla Ice Cream",
                          //       productImg: "assets/images/veg.jpg",
                          //       mPrice: 80,
                          //       discount: 2,
                          //       quantity: 1)
                          // ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                          child: Column(
                        children: <Widget>[
                          // Spacer(),

                          Container(
                            width: w(context),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            height: h(context) / 4.5,
                            // color: Colors.amber,
                            child: ListView(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Cart Total",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18)),
                                    Text("₹${state.maxTotalPrice}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16))
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("GST",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18)),
                                    Text("₹200",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16))
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Delivery",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18)),
                                    Text("₹200",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16))
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Discount",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18)),
                                    Text("₹200",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16))
                                  ],
                                ),
                                SizedBox(height: 5),
                                Divider(
                                  color: Colors.black,
                                  height: 3,
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Sub Total",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18)),
                                    Text("₹2000",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: w(context),
                            // color: Colors.black,
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    height: 50,
                                    width: w(context) / 2,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.1),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: TextField(
                                      autofocus: false,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'Coupon Code'),
                                    )),
                                SizedBox(width: 10),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    decoration: BoxDecoration(
                                      color: yellow,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: InkWell(
                                      onTap: () => {},
                                      child: Text("Apply",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18)),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                              width: w(context) / 1.3,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              decoration: BoxDecoration(
                                  color: yellow,
                                  borderRadius: BorderRadius.circular(30)),
                              child: InkWell(
                                onTap: () => {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Proceed To Checkout",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18)),
                                    SizedBox(width: 5),
                                    Icon(Icons.navigate_next,
                                        color: Colors.black),
                                  ],
                                ),
                              ))
                        ],
                      ))
                    ],
                  ),
                );
              }
            })));
  }

  Dismissible cartList(
      {BuildContext context,
      String productName,
      String productImg,
      double mPrice,
      double discount,
      String productId,
      int quantity}) {
    int price = (mPrice - ((mPrice / 100) * discount)).floor();
    return Dismissible(
      // Show a red background as the item is swiped away.
      background: Container(
        margin: EdgeInsets.only(top: 10, left: 0, right: 0),
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        decoration: BoxDecoration(
          color: yellow,
          // borderRadius: BorderRadius.circular(10),
        ),
        // width: w(context),
      ),
      key: Key(productId),
      onDismissed: (direction) {
        setState(() {
          BlocProvider.of<CartBloc>(context)
                              ..add(RemovefromCart(prodcutId:productId));
        });

        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Product is removed from cart.")));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black87.withOpacity(.1),
                blurRadius: 6,
                // spreadRadius: 4,
              )
            ]),
        width: w(context),
        // height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: w(context) / 2,
              height: h(context) / 10,
              // padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(10)),
                color: yellow,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(10)),
                    child: Image.asset(productImg,
                        height: h(context) / 10 - 40,
                        width: w(context) / 2,
                        fit: BoxFit.cover,
                        alignment: Alignment.center),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "$productName",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () => {},
                  child: Container(
                    // width: 40,
                    // height: 40,
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                        // boxShadow: [
                        // BoxShadow(
                        // color: Colors.black.withOpacity(.1),
                        // blurRadius: 10,
                        // offset: Offset(0, 3))
                        // ],
                        color: yellow,
                        shape: BoxShape.circle),
                    child: Center(
                        child: Text(
                      "-",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.5),
                    )),
                  ),
                ),
                SizedBox(width: 5),
                Text(quantity.toString(),
                    // "10",
                    style: TextStyle(
                        // color: Colors.black.withOpacity(.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                SizedBox(width: 5),
                InkWell(
                  onTap: () => {},
                  child: Container(
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(boxShadow: [
                      // BoxShadow(
                      //     color: Colors.black.withOpacity(.1),
                      //     blurRadius: 10,
                      //     offset: Offset(0, 3))
                    ], color: yellow, shape: BoxShape.circle),
                    child: Center(
                        child: Text(
                      "+",
                      style: TextStyle(
                          // color: Colors.black.withOpacity(.7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(width: 15),
            // Text("₹100",
            //     style: TextStyle(
            //         fontSize: 17, fontWeight: FontWeight.bold)),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: '₹${mPrice.toInt()}\n',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(.5),
                          decoration: TextDecoration.lineThrough)),
                  TextSpan(
                      text: "₹$price",
                      style: TextStyle(color: Colors.black, fontSize: 16))
                ])),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
