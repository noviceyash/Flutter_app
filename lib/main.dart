import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scapes_bouquet/pages/cart_page.dart';
import 'package:scapes_bouquet/pages/home_page.dart';
// import 'package:scapes_bouquet/pages/login.dart';
import 'package:scapes_bouquet/pages/register.dart';
import 'package:scapes_bouquet/utils/routes.dart';
import 'package:scapes_bouquet/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      
      theme: MyTheme.lightTheme(context),
        
      darkTheme: MyTheme.darkTheme(context),

      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.registerRoute: (context) => Register(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
