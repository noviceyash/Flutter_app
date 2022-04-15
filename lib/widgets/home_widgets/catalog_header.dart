import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/themes.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Scapes Bouquet".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Products".text.xl2.make()
      ],
    );
  }
}
