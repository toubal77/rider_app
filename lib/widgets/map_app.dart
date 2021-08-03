import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapApp extends StatefulWidget {
  @override
  _MapAppState createState() => _MapAppState();
}

class _MapAppState extends State<MapApp> {
  Completer<GoogleMapController> _mapController = Completer();

  // ignore: unused_field
  late GoogleMapController _googleController;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
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
    );
  }
}
