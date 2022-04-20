import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scapes_bouquet/models/catalog.dart';
import 'package:scapes_bouquet/widgets/home_widgets/add_to_cart.dart';
import 'package:scapes_bouquet/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:scapes_bouquet/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) 
  : assert(catalog != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
            children: [
                     "\₹${catalog.price}".text.bold.xl4.red800.make(),
                      // ElevatedButton(
                      //   onPressed: () {} ,
                      //   style: ButtonStyle(
                      //     // ignore: deprecated_member_use
                      //     backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
                      //     shape: MaterialStateProperty.all(StadiumBorder(),),
                      //   ),
                      //  child: "Buy".text.make(), 
                      //  )
                      AddToCart(catalog: catalog,).wh(100, 50)
                    ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: 'imageHero${catalog.id.toString()}',
              child: Image.network(catalog.image)).h32(context),
              Expanded(
                child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        catalog.name.text.xl4.color(context.accentColor).bold.make(),
                        catalog.desc.text.make(),
                        10.heightBox,
                        "Gubergren est dolores dolor erat est rebum diam et clita sanctus, eos sed justo aliquyam stet ut, voluptua elitr nonumy amet amet, est sed dolores amet rebum justo lorem sed lorem sed. Labore est vero voluptua vero eirmod, sed magna diam accusam est elitr tempor, ea duo dolore dolor erat."
                        .text
                        .make()
                        .p16()
                      ],
                    ).py64(),
                  ),
                              ),
                )
              )
          ],
        ),
      ),
    );
  }
}
