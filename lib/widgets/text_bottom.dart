import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/provider/app_data.dart';

class TextBottom extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subTitle;
  TextBottom({
    required this.icon,
    required this.title,
    required this.subTitle,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title == 'Add Home'
                  ? Provider.of<AppData>(context).pickUpLocation != null
                      ? Provider.of<AppData>(context).pickUpLocation!.placeName!
                      : 'Add Home'
                  : title,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              subTitle,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
