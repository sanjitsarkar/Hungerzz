import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  String productName;
  String productId;
  int productQuantity;
  String productImage;
  double productMPrice;
  int discount;
  String storeId;
  String productCategory;
  Product(
      {this.productName,
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
      this.productName,
      this.discount,
      this.productCategory,
      this.productImage,
      this.productMPrice,
      this.productQuantity,
      this.storeId,
      this.productId
    }.toString();
  }

  factory Product.fromDoc(DocumentSnapshot doc) {
    return Product(
      productName: doc["productName"],
      productQuantity: doc["productQuantity"],
      productImage: doc["productImage"],
      productMPrice: doc["productMPrice"],
      discount: doc["discount"],
      storeId: doc["storeId"],
      productCategory: doc["productCategory"],
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}
