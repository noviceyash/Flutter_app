import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/themes.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: deprecated_member_use
        "Scapes Bouquet And Greetings".text.xl5.bold.center.color(context.theme.accentColor).make(),
        SizedBox(height: 40.0,),
        "Products".text.xl2.make()
      ],
    );
  }
}
