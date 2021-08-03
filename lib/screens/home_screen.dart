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
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 16,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Hi there',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Where to ?',
                      style: TextStyle(fontSize: 20, fontFamily: 'Brand-Bold'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 6,
                            spreadRadius: 0.5,
                            offset: Offset(0.7, 0.7),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(
                            width: 15,
                          ),
                          Text('Search Drop off'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.yellowAccent,
                      thickness: 1.0,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Add Home'),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Your living home address',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                      thickness: 1.0,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.work,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Add Work'),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Your office address',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
