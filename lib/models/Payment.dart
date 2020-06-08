import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Payment extends Equatable {
  final String paymentId;
  final DateTime paymentDateTime;
  final String method;

  Payment({this.paymentId, this.paymentDateTime, this.method});

  @override
  // TODO: implement props
  List<Object> get props => [];
}
