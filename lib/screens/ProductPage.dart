import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungerzzz/bloc/bloc/cart_bloc.dart';
import 'package:hungerzzz/models/Product.dart';
import 'package:hungerzzz/screens/StorePage.dart';
import 'package:hungerzzz/shared/consts.dart';

class ProductPage extends StatefulWidget {
  Product product;
  ProductPage({Key key, this.product}) : super(key: key);
  static String id = "ProductPage";
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int price;
  int quantity;
  bool isAddedtoCart;
  @override
  void initState() {
    super.initState();
    quantity = 1;
    isAddedtoCart = false;
    price = ((widget.product.discount / widget.product.productMPrice) * 100)
        .floor();
  }

  void increment() {
    setState(() {
      quantity += 1;
      widget.product.productQuantity = quantity;
    });
  }

  void decrement() {
    setState(() {
      if (quantity >= 2) {
        quantity -= 1;
        widget.product.productQuantity = quantity;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: w(context),
            height: h(context),
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20, top: 30, right: 20),
                  width: w(context),
                  height: h(context) / 2 + 30,
                  decoration: BoxDecoration(

                      // borderRadius: BorderRadius.circular(30),

                      image: DecorationImage(
                          image: AssetImage(widget.product.productImage),
                          fit: BoxFit.cover),
                      color: yellow,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(30))),
                  child: Column(
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
                                                color: Colors.white,
                                                width: 1.0)),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "105",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          )
                        ],
                      ),
                      // Container(
                      //   // margin: EdgeInsets.only(top: 10),
                      //   // width: w(context) - 50,
                      //   // height: h(context) / 3,
                      //   width: w(context),
                      //   height: h(context) / 2 + 30,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(30),
                      //       color: Colors.white,
                      //       image: DecorationImage(
                      //           image: AssetImage("assets/images/snacks.jpg"),
                      //           fit: BoxFit.cover)),
                      // )
                    ],
                  ),
                ),
                Positioned(
                  top: h(context) / 2 - 10,
                  right: 30,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 10,
                            offset: Offset(0, 3))
                      ],
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: '₹${widget.product.productMPrice}\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(.5),
                                  decoration: TextDecoration.lineThrough)),
                          TextSpan(
                              text: "₹$price",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20))
                        ])),
                  ),
                ),
                Positioned(
                  top: h(context) / 2 + 50,
                  left: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("${widget.product.productName}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StorePage())),
                        child: Text("${widget.product.storeId}",
                            style: TextStyle(
                                color: Colors.black.withOpacity(.5),
                                fontSize: 20)),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: yellow,
                          ),
                          Text("KOKRAJHAR",
                              style: TextStyle(color: yellow, fontSize: 20))
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () => decrement(),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.1),
                                    blurRadius: 10,
                                    offset: Offset(0, 3))
                              ], color: yellow, shape: BoxShape.circle),
                              child: Center(
                                  child: Text(
                                "-",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              )),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text("$quantity",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.7),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () => increment(),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.1),
                                    blurRadius: 10,
                                    offset: Offset(0, 3))
                              ], color: yellow, shape: BoxShape.circle),
                              child: Center(
                                  child: Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(.7),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              )),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                          // width: w(context) / 1.5,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          decoration: BoxDecoration(
                              color: yellow,
                              borderRadius: BorderRadius.circular(30)),
                          child: InkWell(
                            onTap: () {
                              BlocProvider.of<CartBloc>(context)
                                ..add(AddtoCart(product: widget.product));
                              print(widget.product.productQuantity);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.shopping_basket,
                                    color: Colors.black),
                                SizedBox(width: 10),
                                Text("ADD TO CART",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20))
                              ],
                            ),
                          ))
                    ],
                  ),
                )
              ],
            )));
  }
}
