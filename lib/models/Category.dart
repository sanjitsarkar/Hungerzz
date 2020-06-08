import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
class Category extends Equatable
{
  final String categoryId;
  final String categoryName;

  Category({this.categoryId, this.categoryName});

  factory Category.fromDoc(DocumentSnapshot doc)
  {
    return Category(categoryId: doc["categoryId"],
    categoryName: doc["categoryName"]);
  }

  @override
  // TODO: implement props
  List<Object> get props => [categoryId,categoryName];

}