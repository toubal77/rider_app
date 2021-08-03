import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String idScreen = 'homeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _mapController = Completer();
  late GoogleMapController _googleController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(37.43296265331129, -122.08832357078792),
              zoom: 14.4746,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController.complete(controller);
              _googleController = controller;
            },
          )
        ],
      ),
    );
  }
}
