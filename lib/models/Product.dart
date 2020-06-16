import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String productName;
  final dynamic productId,productUnit;
  final num productQuantity;
  final num productInStock;
  final String productImage;
  final num productMPrice;
  final num discount,sold;
  final String storeId;
  final String productCategory,productCategoryId;
  Product({this.productCategoryId, this.productUnit, this.productInStock, 
      
      this.sold,
      this.productName,
      this.discount,
      this.productCategory,
      this.productImage,
      this.productMPrice,
      this.productQuantity,
      this.storeId,
      this.productId});
  @override
  String toString() {
    // TODO: implement toString
    return {
      this.productUnit, this.productInStock, 
      this.sold,
      this.productName,
      this.discount,
      this.productCategoryId,this.productCategory,
      this.productImage,
      this.productMPrice,
      this.productQuantity,
      this.storeId,
      this.productId
    }.toString();
  }

  factory Product.fromDoc(DocumentSnapshot doc) {
    return Product(

      productId: doc.documentID??"",
      productCategoryId: doc["productCategoryId"]??"",
      productInStock: doc["productInStock"]??0,
      productUnit: doc["productUnit"]??"",
      sold:doc["sold"]??0,
      productName: doc["productName"]??"",
      productQuantity: doc["productQuantity"]??0,
      productImage: doc["productImage"]??"",
      productMPrice: doc["productMPrice"]??0,
      discount: doc["discount"]??0,
      storeId: doc["storeId"]??"",
      productCategory: doc["productCategory"]??"",
      
    );
  }

  Map<String, dynamic> toJson() => {
    'productCategoryId':this.productCategoryId,
        'productName': this.productName,
        'discount': this.discount,
        'productCategory': this.productCategory,
        'productImage': this.productImage,
        'productMPrice': this.productMPrice,
        'productQuantity': this.productQuantity,
        'storeId': this.storeId,
        'sold': this.sold,
        'productInStock':this.productInStock,
        'productUnit':this.productUnit

      };

  @override
  // TODO: implement props
  List<Object> get props => [];
}
