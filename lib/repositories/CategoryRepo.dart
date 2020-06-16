// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hungerzz_store/models/Category.dart';
import '../models/ProductCategory.dart';
// import '../models/Store.dart';
import '../repositories/AuthRepo.dart';

import './StoreRepo.dart';
// import 'package:hungerzz_store/repositories/StoreRepo.dart';

class ProductCategoryRepo {
  Firestore _firestore = Firestore.instance;
  String uid;
AuthRepo _authRepo = AuthRepo();
StoreRepo  _storeRepo= StoreRepo();
  Future<List<dynamic>> getCategory() async {
    QuerySnapshot snapshot =
        await _firestore.collection("Categories").getDocuments();
    print(snapshot.documents.length);
    return snapshot.documents.map((doc) => doc.data["categoryName"]).toList();
  }

 
 
}
