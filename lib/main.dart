import 'package:flutter/material.dart';
import 'package:scapes_bouquet/pages/home_page.dart';
import 'package:scapes_bouquet/pages/login.dart';
import 'package:scapes_bouquet/pages/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/home",
      routes: {
        "/": (context) => Register(),
        "/register": (context) => HomePage(),
      },
    );
  }
}
