import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hungerzzz/models/Address.dart';
import 'package:hungerzzz/models/CartItem.dart';

class User extends Equatable {
  final String uid;
  final List<Address> addresses;
  final String phoneNumber;
  final DateTime joinDateTime;
  final List<CartItem> cartItems;
  final List<int> orderNo;
  final List<String> favProductId;

  User(
      {this.joinDateTime,
      this.uid,
      this.addresses,
      this.phoneNumber,
      this.cartItems,
      this.orderNo,
      this.favProductId});
  factory User.fromDoc(DocumentSnapshot doc) {
    return User(
        addresses: doc["addresses"],
        cartItems: doc["cartItems"],
        favProductId: doc["favProductId"],
        orderNo: doc["orderNo"],
        phoneNumber: doc["phoneNumber"],
        uid: doc["uid"],
        joinDateTime: doc["joinDateTime"]);
  }

  @override
  // TODO: implement props
  List<Object> get props =>
      [uid, addresses, phoneNumber, cartItems, orderNo, favProductId];
}
