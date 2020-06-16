import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:firebase_storage/firebase_storage.dart';
import '../models/Store.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoreRepo {
  Firestore _firestore = Firestore.instance;

  
  Future<Store> getStoreDetails({String uid}) async {
    DocumentSnapshot snapshot =
        await _firestore.collection('Stores').document(uid).get();
    return Store.fromDoc(snapshot);
  }
 Future<List<Store>> getStores({String uid}) async {
    QuerySnapshot snapshots =
        await _firestore.collection('Stores').getDocuments();
    return snapshots.documents.map((snap) => Store.fromDoc(snap)).toList();
  }
 Future<String> getStoreName({String storeId})  async{
   DocumentSnapshot snapshot =
         await _firestore.collection('Stores').document(storeId).get();
    return snapshot["storeName"];
  }
}
