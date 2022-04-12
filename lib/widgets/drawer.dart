import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scapes_bouquet/pages/home_page.dart';
import 'package:scapes_bouquet/utils/routes.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepOrange,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Yash Margaje"),
                accountEmail: Text("noviceyash21@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/sign_up_image.png"),
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home, 
              color: Colors.white,
              ),
              title: Text(
                "Home",
                 textScaleFactor: 1.2,
                 style: TextStyle(
                   color: Colors.white,
                 ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled, 
              color: Colors.white,
              ),
              title: Text(
                "Profile",
                 textScaleFactor: 1.2,
                 style: TextStyle(
                   color: Colors.white,
                 ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail, 
              color: Colors.white,
              ),
              title: Text(
                "Email me",
                 textScaleFactor: 1.2,
                 style: TextStyle(
                   color: Colors.white,
                 ),
              ),
            )
          ],
        ),
      )
    );
  }
}