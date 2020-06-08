import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserDetails extends Equatable {
  final String username, email, displayPic, uid;

  UserDetails({this.username, this.email, this.displayPic, this.uid});

  @override
  // TODO: implement props
  List<Object> get props => [username, email, displayPic, uid];

  factory UserDetails.fromDoc(DocumentSnapshot doc) {
    return UserDetails(
        uid: doc['uid'],
        username: doc['username'],
        email: doc['email'],
        displayPic: doc['displayPic']);
  }
}
