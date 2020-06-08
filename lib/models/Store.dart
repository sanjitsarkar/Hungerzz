import 'package:equatable/equatable.dart';
import 'package:hungerzzz/models/Address.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store extends Equatable {
  final String storeId;
  final String storeName;
  final String storeImage;
  final List<String> productId;
  final bool isClosed;
  final List<String> contactNo;
  final Address address;
  final String storeType;
  final DateTime joinDate;
  final String storeOwnerUid;
  final double todaySold, totalSold;

  Store(
      {this.storeOwnerUid,
      this.storeId,
      this.contactNo,
      this.storeName,
      this.storeImage,
      this.productId,
      this.isClosed,
      this.address,
      this.storeType,
      this.joinDate,
      this.todaySold,
      this.totalSold});
  factory Store.fromDoc(DocumentSnapshot doc) {
    return Store(
      address: doc["address"],
      isClosed: doc["isClosed"],
      joinDate: doc["joinDate"],
      productId: doc["productId"],
      storeId: doc["storeId"],
      storeImage: doc["storeImage"],
      storeName: doc["storeName"],
      storeOwnerUid: doc["storeOwnerUid"],
      storeType: doc["storeType"],
      todaySold: doc["todaySold"],
      totalSold: doc["todaySold"],
      contactNo: doc["contactNo"],
    );
  }
  @override
  // TODO: implement props
  List<Object> get props => [];
}
