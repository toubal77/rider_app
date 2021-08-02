import 'package:flutter/material.dart';
import 'package:rider_app/auth/singup_screen.dart';
import 'package:rider_app/auth/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String idScreen = 'mainScreen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uber Clone',
      theme: ThemeData(
        fontFamily: "Brand Bold",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginScreen.idScreen,
      routes: {
        SingUpScreen.idScreen: (context) => SingUpScreen(),
        LoginScreen.idScreen: (context) => LoginScreen(),
        MyApp.idScreen: (context) => MyApp(),
      },
    );
  }
}
