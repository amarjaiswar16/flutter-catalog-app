import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    //await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString('assets/files/catalog.json');
    var decodeData = jsonDecode(catalogJson);

    var productData = decodeData['products'];
    // print(productData);

    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: MyTheme.creamColor,
      backgroundColor: context.cardColor,

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartPageRoute);
        },
        //backgroundColor: MyTheme.darkBluishColor,
        backgroundColor: context.theme.highlightColor,
        child: const Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(children: [
            const CatalogHeader(),
            // CatalogList(),
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              const CatalogList().py(16).expand()
            else
              const CircularProgressIndicator().centered().expand()
          ]),
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text(
    //       "Catalog App",
    //       style: TextStyle(color: Colors.black),
    //     ),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: GridView.builder(
    //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         mainAxisSpacing: 16,
    //         crossAxisSpacing: 16,
    //       ),
    //       itemBuilder: (context, index) {
    //         final item = CatalogModel.items[index];
    //         return Card(
    //           clipBehavior: Clip.antiAlias,
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(12)),
    //           child: GridTile(
    //             header: Container(
    //               padding: const EdgeInsets.all(12),
    //               decoration: const BoxDecoration(
    //                 color: Colors.deepPurple,
    //               ),
    //               child: Text(
    //                 item.name,
    //                 style: const TextStyle(
    //                   color: Colors.white,
    //                 ),
    //               ),
    //             ),
    //             footer: Container(
    //               padding: const EdgeInsets.all(12),
    //               decoration: const BoxDecoration(
    //                 color: Colors.black,
    //               ),
    //               child: Text(
    //                 item.price.toString(),
    //                 style: const TextStyle(color: Colors.white),
    //               ),
    //             ),
    //             child: Image.network(item.image),
    //           ),
    //         );
    //       },
    //       itemCount: CatalogModel.items.length,
    //     ),
    //     // ListView.builder(
    //     //     itemCount: CatalogModel.items.length,
    //     //     itemBuilder: (context, index) {
    //     //       return ItemWidget(item: CatalogModel.items[index]);
    //     //     }),
    //   ),
    //   drawer: const MyDrawer(),
    // );
  }
}

// class CatalogHeader extends StatelessWidget {
//   const CatalogHeader({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       'Catalog App'.text.xl5.bold.color(MyTheme.darkBluishColor).make(),
//       'Treding Products'.text.xl2.make(),
//     ]);
//   }
// }

// class CatalogList extends StatelessWidget {
//   const CatalogList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         shrinkWrap: true,
//         itemCount: CatalogModel.items.length,
//         itemBuilder: (context, index) {
//           final catalog = CatalogModel.items[index];
//           return CatalogItem(catalog: catalog);
//         });
//   }
// }

//  class CatalogItem extends StatelessWidget {
//   const CatalogItem({super.key, required this.catalog});

//   final Item catalog;
//   @override
//   Widget build(BuildContext context) {
//     return VxBox(
//         child: Row(
//       children: [
//         CatalogImage(image: catalog.image),
//         Expanded(
//             child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             catalog.name.text.lg.bold.color(MyTheme.darkBluishColor).make(),
//             catalog.desc.text.textStyle(context.captionStyle).make(),
//             10.heightBox,
//             ButtonBar(
//               alignment: MainAxisAlignment.spaceBetween,
//               buttonPadding: EdgeInsets.zero,
//               children: [
//                 '\$${catalog.price}'.text.bold.xl.make(),
//                 ElevatedButton(
//                     onPressed: () {},
//                     style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all(MyTheme.darkBluishColor),
//                       shape: MaterialStateProperty.all(
//                         StadiumBorder(),
//                       ),
//                     ),
//                     child: 'Buy'.text.make())
//               ],
//             ).pOnly(right: 8.0)
//           ],
//         ))
//       ],
//     )).white.roundedLg.square(150).make().py16();
//   }
// }

// class CatalogImage extends StatelessWidget {
//   const CatalogImage({super.key, required this.image});

//   final String image;
//   @override
//   Widget build(BuildContext context) {
//     return Image.network(image)
//         .box
//         .rounded
//         .p8
//         .color(MyTheme.creamColor)
//         .make()
//         .p16()
//         .w40(context);
//   }
// }
