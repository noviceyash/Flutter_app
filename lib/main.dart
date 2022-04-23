import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scapes_bouquet/core/store.dart';
import 'package:scapes_bouquet/pages/cart_page.dart';
import 'package:scapes_bouquet/pages/home_page.dart';
import 'package:scapes_bouquet/pages/payment.dart';
// import 'package:scapes_bouquet/pages/login.dart';
import 'package:scapes_bouquet/pages/register.dart';
import 'package:scapes_bouquet/utils/routes.dart';
import 'package:scapes_bouquet/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.registerRoute,
      routes: {
        MyRoutes.registerRoute: (context) => Register(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.cartRoute: (context) => CartPage(),
        MyRoutes.paymentRoute: (context) => Payment(),
      },
      
    );
  }
}

// class Payment extends StatefulWidget {
//   const Payment({ Key? key }) : super(key: key);

//   @override
//   State<Payment> createState() => _PaymentState();
// }

// class _PaymentState extends State<Payment> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }
