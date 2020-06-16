import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategory
{
  final String categoryId,categoryName;
  final String uid;

  ProductCategory({this.categoryId, this.categoryName, this.uid});

  factory ProductCategory.fromDoc(DocumentSnapshot doc)
  {
    return ProductCategory(categoryId: doc.documentID,
    categoryName: doc["categoryName"],
    uid: doc["uid"]
    );
  }
    Map<String,dynamic> toJson()=>
  {
  
    "categoryName": this.categoryName,
    "uid": this.uid
  };
}