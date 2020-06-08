import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String paymentMethod;
  final int orderNo;
  final DateTime orderDateTime, cancelDateTime, recieveDateTime;
  final bool isOrderPathched;
  final bool isOrderRecieved;
  final String totalPrice;
  final int paymentId;
  final String maxPrice;
  final String deliveryCharge;
  final String cartItemId;
  final bool isCancelled;
  final bool isOutofStock;

  Order(
      {this.paymentMethod,
      this.orderNo,
      this.paymentId,
      this.orderDateTime,
      this.isOrderPathched,
      this.isOrderRecieved,
      this.totalPrice,
      this.maxPrice,
      this.deliveryCharge,
      this.cartItemId,
      this.isCancelled,
      this.isOutofStock,
      this.cancelDateTime,
      this.recieveDateTime});
  factory Order.fromDoc(DocumentSnapshot doc) {
    return Order(
        paymentId: doc["paymentId"],
        cartItemId: doc["cartItemId"],
        deliveryCharge: doc["deliveryCharge"],
        isCancelled: doc["isCancelled"],
        isOrderPathched: doc["isOrderPathched"],
        isOrderRecieved: doc["isOrderRecieved"],
        isOutofStock: doc["isOutofStock"],
        maxPrice: doc["maxPrice"],
        orderDateTime: doc["orderDateTime"],
        orderNo: doc["orderNo"],
        paymentMethod: doc["paymentMethod"],
        totalPrice: doc["totalPrice"],
        cancelDateTime: doc["cancelDateTime"],
        recieveDateTime: doc["recieveDateTime"]);
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        this.paymentMethod,
        this.orderNo,
        this.orderDateTime,
        this.isOrderPathched,
        this.isOrderRecieved,
        this.totalPrice,
        this.maxPrice,
        this.deliveryCharge,
        this.cartItemId,
        this.isCancelled,
        this.isOutofStock,
        this.cancelDateTime,
        this.recieveDateTime
      ];
}
