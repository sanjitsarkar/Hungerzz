 import 'package:flutter/material.dart';
//  import 'package:google_maps_flutter/google_maps_flutter.dart';

 class AddressPage extends StatefulWidget {
   AddressPage({Key key}) : super(key: key);
   static String id = "AddressPage";
   @override
   _AddressPageState createState() => _AddressPageState();
 }

 class _AddressPageState extends State<AddressPage> {
   @override
  //  GoogleMapController mapController;

  //  final LatLng _center = const LatLng(45.521563, -122.677433);

  //  void _onMapCreated(GoogleMapController controller) {
  //    mapController = controller;
  //  }

   Widget build(BuildContext context) {
     return Scaffold(
         body:
         Container(),
    //      GoogleMap(
    //    onMapCreated: _onMapCreated,
    //    initialCameraPosition: CameraPosition(
    //      target: _center,
    //      zoom: 11.0,
    //    ),
    //  )
    );
   }
 }
