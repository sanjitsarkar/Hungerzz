import 'package:cloud_firestore/cloud_firestore.dart';

class CartItem {

  String productId,cartItemId;
  int quantity;
  
  CartItem(
      {
      this.quantity,
      this.productId,
      this.cartItemId});
  @override
  String toString() {
    // TODO: implement toString
    return {
   
      this.quantity,
     
      this.productId
    }.toString();
  }

  factory CartItem.fromDoc(DocumentSnapshot doc) {
    return CartItem(
      cartItemId:doc["cartItemId"],
      quantity: doc["quantity"],
      productId: doc["productId"]
    );
  }
}
