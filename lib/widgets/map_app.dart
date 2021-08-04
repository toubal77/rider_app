import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider_app/services/methos.dart';

class MapApp extends StatefulWidget {
  @override
  _MapAppState createState() => _MapAppState();
}

class _MapAppState extends State<MapApp> {
  Completer<GoogleMapController> _mapController = Completer();

  // ignore: unused_field
  late GoogleMapController _googleController;
  double bottomPaddingMap = 0;
  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    LatLng latLatPosistion = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLatPosistion, zoom: 14);
    _googleController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    String address = await Methods.searchCoordinationAddress(position, context);
    print('This is your Address: ' + address);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      padding: EdgeInsets.only(bottom: bottomPaddingMap),
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(37.43296265331129, -122.08832357078792),
        zoom: 14.4746,
      ),
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
        _googleController = controller;
        locatePosition();
        setState(() {
          bottomPaddingMap = 300.0;
        });
      },
    );
  }
}
