import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scapes_bouquet/core/store.dart';
import 'package:scapes_bouquet/models/cart.dart';
import 'package:scapes_bouquet/models/catalog.dart';
import 'package:scapes_bouquet/utils/routes.dart';
import 'package:scapes_bouquet/widgets/themes.dart';
import "dart:convert";
import '../widgets/drawer.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import '../widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, _, __) => FloatingActionButton(
                onPressed: () =>
                    Navigator.pushNamed(context, MyRoutes.cartRoute),
                // ignore: deprecated_member_use
                backgroundColor: context.theme.buttonColor,
                child: Icon(CupertinoIcons.cart),
              ).badge(
                  color: Vx.orange500,
                  size: 26,
                  count: _cart.items.length,
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ))),
      // appBar: AppBar(
      //   title: Text("Scapes Bouquet"),
      // ),
      // now using velocity_x package to make ui better
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}

// Padding(
//   padding: const EdgeInsets.all(16.0),
//   child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
//       ?
// ListView.builder(
//   itemCount: CatalogModel.items!.length,
//   itemBuilder: (context, index) =>
//      ItemWidget(
//       item: CatalogModel.items![index],
//     ),
// )
//             GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 16,
//                   crossAxisSpacing: 16,
//                 ),
//                 itemBuilder: (context, index) {
//                   final item = CatalogModel.items![index];
//                   return Card (
//                     clipBehavior: Clip.antiAlias,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                     child: GridTile(
//                       header: Container(
//                         child: Text(
//                           item.name,
//                           style: TextStyle(color: Colors.white
//                           ),
//                           ),
//                         padding: const EdgeInsets.all(12),
//                         decoration: BoxDecoration(
//                           color: Colors.deepOrange,
//                         ),
//                         ),
//                       child: Image.network(item.image),
//                       footer: Container(
//                         child: Text(
//                           item.price.toString(),
//                           style: TextStyle(color: Colors.white
//                           ),
//                           ),
//                         padding:const EdgeInsets.all(12),
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                         ),
//                         ),
//                       )
//                       );
//                 },
//                 itemCount: CatalogModel.items!.length,
//               )
//             : Center(
//                 child: CircularProgressIndicator(),
//               ),
//       ),
//       drawer: MyDrawer(),
//     );
//   }
// }
