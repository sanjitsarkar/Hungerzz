import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class AdClient extends Equatable {
  final String uid;
  final List<String> bannerId;
  final double totalSpend;
  final DateTime joinDateTime;

  AdClient({this.uid, this.bannerId, this.totalSpend, this.joinDateTime});
  factory AdClient.fromDoc(DocumentSnapshot doc) {
    return AdClient(
        bannerId: doc["bannerId"],
        uid: doc["uid"],
        totalSpend: doc["totalSpend"],
        joinDateTime: doc["joinDateTime"]);
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}
