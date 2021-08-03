import 'package:flutter/material.dart';

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
            Text(title),
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
