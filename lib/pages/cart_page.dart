import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: 'Cart'.text.xl2.make(),
      ),
      body: Column(children: [
        _CartList().p32().expand(),
        Divider(),
        _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        '\$${_cart.totalPrice}'
            .text
            .xl4
            .color(context.theme.highlightColor)
            .make(),
        30.widthBox,
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: 'Buying not supported yet.'.text.make(),
              ),
            );
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.theme.highlightColor)),
          child: 'Buy'.text.white.make(),
        ).w32(context),
      ]),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(
            Icons.done,
            color: context.theme.highlightColor,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            color: context.theme.highlightColor,
            onPressed: () {},
          ),
          title: _cart.items[index].name.text
              .color(context.theme.highlightColor)
              .make(),
        );
      },
      itemCount: _cart.items.length,
    );
  }
}
