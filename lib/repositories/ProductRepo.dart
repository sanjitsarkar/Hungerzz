// import 'dart:io';

import 'package:hungerzzz/models/Product.dart';
// import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepo {
  Firestore _firestore = Firestore.instance;

  Future<List<Product>> getProductDetails(String storeId) async {
    // print('Recieved');
    QuerySnapshot snaps = await _firestore
        .collection('Products')
        .where("storeId", isEqualTo: storeId)
        .limit(5)
        .getDocuments();

    // QuerySnapshot snaps = await _firestore.collection('Wallpapers').where(
//   'tags',arrayContains: srch
// )
// .limit(10).getDocuments();

    return snaps.documents.map((doc) => Product.fromDoc(doc)).toList();
  }

  Future<List<Product>> getProductDetailsByCategory( String categoryId) async {
  
    QuerySnapshot snaps = await _firestore
        .collection('Products')
        .where("productCategoryId", isEqualTo: categoryId)
        .limit(5)
        .getDocuments();

    // QuerySnapshot snaps = await _firestore.collection('Wallpapers').where(
//   'tags',arrayContains: srch
// )
// .limit(10).getDocuments();

    return snaps.documents.map((doc) => Product.fromDoc(doc)).toList();
  }
  Future<List<Product>> getProductDetailsByCategoryStore(
      String storeId, String categoryId) async {
    print(storeId);
    QuerySnapshot snaps = await _firestore
        .collection('Products')
        .where("storeId", isEqualTo: storeId)
        .where("productCategoryId", isEqualTo: categoryId)
        .limit(5)
        .getDocuments();

    // QuerySnapshot snaps = await _firestore.collection('Wallpapers').where(
//   'tags',arrayContains: srch
// )
// .limit(10).getDocuments();

    return snaps.documents.map((doc) => Product.fromDoc(doc)).toList();
  }

  Future<List<Product>> getProductDetailsByStoreType(
      String storeId, String categoryId) async {
    print(storeId);
    QuerySnapshot snaps = await _firestore
        .collection('Products')
        .where("storeId", isEqualTo: storeId)
        .where("productCategoryId", isEqualTo: categoryId)
        .limit(5)
        .getDocuments();

    // QuerySnapshot snaps = await _firestore.collection('Wallpapers').where(
//   'tags',arrayContains: srch
// )
// .limit(10).getDocuments();

    return snaps.documents.map((doc) => Product.fromDoc(doc)).toList();
  }
  Future<List<Product>> getPopularProducts() async {
  
    QuerySnapshot snaps = await _firestore
        .collection('Products')
        // .orderBy('sold',descending: true)
        .limit(5)
        .getDocuments();

    // QuerySnapshot snaps = await _firestore.collection('Wallpapers').where(
//   'tags',arrayContains: srch
// )
// .limit(10).getDocuments();

    return snaps.documents.map((doc) => Product.fromDoc(doc)).toList();
  }
   Future<List<Product>> getCheapestProducts() async {
  
    QuerySnapshot snaps = await _firestore
        .collection('Products')
        .orderBy('sold',descending: true)
        .limit(5)
        .getDocuments();

    // QuerySnapshot snaps = await _firestore.collection('Wallpapers').where(
//   'tags',arrayContains: srch
// )
// .limit(10).getDocuments();

    return snaps.documents.map((doc) => Product.fromDoc(doc)).toList();
  }
}
