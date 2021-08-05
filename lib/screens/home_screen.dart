import 'package:flutter/material.dart';
import 'package:rider_app/widgets/drawer_app.dart';
import 'package:rider_app/widgets/drawer_drawer.dart';
import 'package:rider_app/widgets/map_app.dart';
import 'package:rider_app/widgets/search_field.dart';
import 'package:rider_app/widgets/text_bottom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String idScreen = 'homeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            MapApp(),
            DrawerApp(keyScaffold: _scaffoldKey),
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
                        style:
                            TextStyle(fontSize: 20, fontFamily: 'Brand-Bold'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SearchField(),
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
                      TextBottom(
                        icon: Icon(Icons.home, color: Colors.grey),
                        title: 'Add Home',
                        subTitle: 'Your living home address',
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
                      TextBottom(
                        icon: Icon(Icons.work, color: Colors.grey),
                        title: 'Add Work',
                        subTitle: 'Your office address',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
