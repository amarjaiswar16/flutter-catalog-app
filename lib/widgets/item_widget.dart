import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  // ItemWidget({Key key, required this.item}): assert(item != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    //int i = 0;
    return Card(

      child: ListTile(
        onTap: () {
         // print('${item.name} pressed');
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          '\$ ${item.price}',
          textScaleFactor: 1.4,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
