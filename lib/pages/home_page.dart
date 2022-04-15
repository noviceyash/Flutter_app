
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scapes_bouquet/models/catalog.dart';
import 'package:scapes_bouquet/widgets/themes.dart';
import "dart:convert";
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

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
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
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
                if (CatalogModel.items != null &&
                    CatalogModel.items!.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}

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

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
            image: catalog.image,
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
                catalog.desc.text.make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\₹${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: () {} ,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor,),
                        shape: MaterialStateProperty.all(StadiumBorder(),),
                      ),
                     child: "Buy".text.make(), 
                     )
                  ],
                ).pOnly(right: 8.0)
              ],
              )
            )  
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(MyTheme.creamColor).make().p16().wh40(context);
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
