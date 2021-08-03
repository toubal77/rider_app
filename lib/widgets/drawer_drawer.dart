import 'package:flutter/material.dart';

class DrawerDrawer extends StatelessWidget {
  const DrawerDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.white,
      child: ListView(
        children: [
          Container(
            height: 160,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Image.asset('assets/images/user_icon.png',
                      height: 65, width: 65),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Toubal zineddine',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Brand-Bold',
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Visit Profile',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Brand-Bold',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
            thickness: 1.0,
          ),
          ListTile(
            leading: Icon(
              Icons.history,
            ),
            title: Text(
              'History',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
            ),
            title: Text(
              'Visit profile',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
            ),
            title: Text(
              'About',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
