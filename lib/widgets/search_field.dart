import 'package:flutter/material.dart';
import 'package:rider_app/screens/search_screen.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchScreen(),
          ),
        );
      },
      child: Container(
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
    );
  }
}
