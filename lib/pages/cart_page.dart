import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';

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
        const Divider(),
        const _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        VxConsumer(
          mutations:const  {RemoveMutation},
          builder: (context, store, status) {
            return '\$${_cart.totalPrice}'
                .text
                .xl4
                .color(context.theme.highlightColor)
                .make();
          },
        ),
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

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? 'Nothing to show'.text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  Icons.done,
                  color: context.theme.highlightColor,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  color: context.theme.highlightColor,
                  onPressed: () {
                    RemoveMutation(_cart.items[index]);
                  },
                ),
                title: _cart.items[index].name.text
                    .color(context.theme.highlightColor)
                    .make(),
              );
            },
          );
  }
}
