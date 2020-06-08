import 'package:flutter/material.dart';
import 'package:hungerzzz/shared/consts.dart';

class CheckoutPage extends StatefulWidget {
  CheckoutPage({Key key}) : super(key: key);
  static String id = "CheckoutPage";
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(color: Colors.black),
        primary: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context)),
        elevation: 1,
        title: Text("Schedule Delivery", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: w(context),
          height: h(context),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _orderTotal(context: context,totalPrice:2000),
              SizedBox(height: 20),
              _shippingInfoCard(context:context,cityName: "Kokrajhar",isAdAvailable:false,contactNo: "8638701773",address: "Station Road, Lane - 34"),
              Container(
                width: w(context),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        color: Colors.black87.withOpacity(.1),
                        blurRadius: 10)
                  ],
                  color: yellow,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(25)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Delivery Method",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18)),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                          onTap: () => {},
                          child: Image.asset(
                            "assets/images/google_pay.png",
                            width: 40,
                            height: 40,
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () => {},
                          child: Image.asset(
                            "assets/images/paytm.png",
                            width: 50,
                            height: 50,
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            color:Colors.white,
                              borderRadius: BorderRadius.circular(20),
//                              border:
//                                  Border.all(color: Colors.black, width: 1)
                                  ),
                          child: InkWell(
                              onTap: () => print("Hello"),
                              child: Text(
                                "Cash On Delivery",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              )),
                        ),
// Image.asset("")
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  decoration: BoxDecoration(
                    color: yellow,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: InkWell(
                      onTap: () => print("Hello"),
                      child: Text(
                        "Place Order",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _orderTotal({BuildContext context,double totalPrice}) {
    int price = totalPrice.floor();
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Order Total",
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 18)),
                Text("₹$price",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 16))
              ],
            );
  }

  Container _shippingInfoCard({BuildContext context,bool isAdAvailable,String cityName,String address,String contactNo,VoidCallback change,VoidCallback addAddress}) {
    return Container(
              width: w(context),
              // height: h(context) / 2,
              decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(.1), blurRadius: 10)
                  ]),
              child: Column(
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25)),
                    ),
                    width: w(context),
                    // height: h(context) / 2 - 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Shipping Informtion",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                            
                              isAdAvailable? Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: yellow, width: 1)),
                              child: InkWell(
                                  onTap: () => print("Hello"),
                                  child: Text("Change")),
                            ):Container()
                              
  // your code here

                               
                          
                            

                          ],
                        ),
                        RichText(
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.fade,
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: '$cityName,\n',
                                  style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(.7),
                                  )),
                              TextSpan(
                                  text: "$address\n",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(.7),
                                      fontSize: 16)),
                              TextSpan(
                                  text: contactNo,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(.7),
                                      fontSize: 16))
                            ]))
                      ],
                    ),
                  )
                ],
              ),
            );
  }
}
