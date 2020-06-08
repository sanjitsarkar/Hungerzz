import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
class Address extends Equatable
{
  final String cityName;
  final String location;

  Address({this.cityName, this.location});
   @override
  // TODO: implement props
  List<Object> get props => [cityName,location];

  factory Address.fromDoc(DocumentSnapshot doc)
  {
    return Address(
      cityName:doc["cityName"],
      location: doc["location"]

    );
  }
}