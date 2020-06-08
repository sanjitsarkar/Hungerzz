import 'package:equatable/equatable.dart';
class Banner extends Equatable {
  final String bannerImg;
  final String bannerId;
  final String bannerDetails;
  final String bannerLink;
  final int totalViews;
  final int todayViews;
  final int totalCicks;
  final int todayCicks;
  final DateTime bannerStartDateTime;
  final DateTime bannerExpireDateTime;
  final int mPrice;
  final int discount;
  final int paymentId;

  Banner({this.paymentId, this.mPrice, this.discount, this.totalViews, this.todayViews, this.totalCicks, this.todayCicks, this.bannerImg, this.bannerDetails, this.bannerLink, this.bannerStartDateTime, this.bannerExpireDateTime, this.bannerId});

  @override
  // TODO: implement props
  List<Object> get props => [];
}
