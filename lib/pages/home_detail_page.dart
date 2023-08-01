import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
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
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            '\$${catalog.price}'.text.bold.xl4.red800.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkBluishColor),
                      shape: MaterialStateProperty.all(
                        const StadiumBorder(),
                      ),
                    ),
                    child: 'Add to cart'.text.make())
                .wh(120, 50)
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
                color: Colors.white,
                child: Column(children: [
                  catalog.name.text.xl4.bold
                      .color(MyTheme.darkBluishColor)
                      .make(),
                  catalog.desc.text.lg.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  'Eirmod tempor amet ipsum diam sanctus eos diam nonumy sed et. Clita sit et duo amet nonumy, eos sanctus et.'
                      .text
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
