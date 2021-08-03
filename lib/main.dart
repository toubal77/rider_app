import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/auth/singup_screen.dart';
import 'package:rider_app/auth/login_screen.dart';
import 'package:rider_app/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

DatabaseReference userRef =
    FirebaseDatabase.instance.reference().child('users');

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
      initialRoute: HomeScreen.idScreen,
      routes: {
        HomeScreen.idScreen: (context) => HomeScreen(),
        SingUpScreen.idScreen: (context) => SingUpScreen(),
        LoginScreen.idScreen: (context) => LoginScreen(),
        MyApp.idScreen: (context) => MyApp(),
      },
    );
  }
}
