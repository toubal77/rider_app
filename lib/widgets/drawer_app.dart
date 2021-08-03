import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  final keyScaffold;
  DrawerApp({
    required this.keyScaffold,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 22,
      child: GestureDetector(
        onTap: () {
          keyScaffold.currentState!.openDrawer();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 6,
                spreadRadius: 0.5,
                offset: Offset(0.7, 0.7),
              ),
            ],
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            radius: 20,
          ),
        ),
      ),
    );
  }
}
