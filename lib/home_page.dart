import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scapes Bouquet"),
      ),
      body: Center(
        child: Container(
          child: Text("Scapes Home Page"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
