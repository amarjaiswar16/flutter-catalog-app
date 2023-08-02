import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key, required this.catalog});

  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            '\$${catalog.price}'.text.bold.xl4.red800.make(),
            // ElevatedButton(
            //         onPressed: () {},
            //         style: ButtonStyle(
            //           backgroundColor: MaterialStateProperty.all(
            //               context.theme.highlightColor),
            //           shape: MaterialStateProperty.all(
            //             const StadiumBorder(),
            //           ),
            //         ),
            //         child: 'Add to cart'.text.make())
            AddToCart(
              catalog: catalog,
            ).wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image),
          ).h40(context),
          Expanded(
            child: VxArc(
              height: 30.0,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
                width: context.screenWidth,
                color: context.cardColor,
                child: Column(children: [
                  catalog.name.text.xl4.bold
                      .color(context.theme.highlightColor)
                      .make(),
                  catalog.desc.text
                      .color(context.theme.highlightColor)
                      .lg
                      .textStyle(context.captionStyle)
                      .make(),
                  10.heightBox,
                  'Eirmod tempor amet ipsum diam sanctus eos diam nonumy sed et. Clita sit et duo amet nonumy, eos sanctus et.'
                      .text
                      .color(context.theme.highlightColor)
                      .textStyle(context.captionStyle)
                      .make()
                      .pOnly(left: 14, right: 14)
                ]).py64(),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
