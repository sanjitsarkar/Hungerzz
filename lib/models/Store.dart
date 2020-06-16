// import 'package:equatable/equatable.dart';
// import 'Address.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store  {
  final String storeId;
  final int totalProduct;
  final int totalCategory;
  final String storeName;
  final String storeImage;
  final List<dynamic> productId;
  final bool isClosed;
  final List<dynamic> contactNo;
  final dynamic address;
  final String storeType;
  final DateTime joinDate;
  // final String storeOwnerUid;
  final List<dynamic> categoryId;
  final double todaySold, totalSold;

  Store({
    this.categoryId,
    this.totalProduct, this.totalCategory, 
      // this.storeOwnerUid,
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
      categoryId:doc["categoryId"],
      address: doc["address"]??'',
      isClosed: doc["isClosed"]??'',
      // joinDate: (doc["joinDate"] as DateTime)??'' ,
      productId: doc["productId"]??'',
      storeId: doc.documentID??'',
      storeImage: doc["storeImage"]??'',
      storeName: doc["storeName"]??'',
      // storeOwnerUid: doc["storeOwnerUid"]??'',
      storeType: doc["storeType"]??'',
      todaySold: doc["todaySold"]??0,
      totalSold: doc["todaySold"]??0,
      contactNo: doc["contactNo"]??0,
      totalCategory: doc["totalCategory"]??0,
      totalProduct: doc["totalProduct"]??0
    );
  }

   Map<String, dynamic> toJson() =>
  {
    'categoryId':this.categoryId,
      'contactNo':this.contactNo,
      'storeName':this.storeName,
      'storeImage':this.storeImage,
      'productId':this.productId,
      'isClosed':this.isClosed,
      'address':this.address,
      'storeType':this.storeType,
      'joinDate':this.joinDate,
      'todaySold':this.todaySold,
      'totalSold':this.totalSold,
      'totalCategory':this.totalCategory,
      'totalProduct':this.totalProduct

  };
 
}
