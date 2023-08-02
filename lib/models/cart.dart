
import 'package:flutter_catalog/models/catalog.dart';

class CartModel {

  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;


  //catalog field
  late CatalogModel _catalog;

  //Collection of IDs - store Id of each item
  final List<int> _itemIds = [];

  //Get Catalog
  CatalogModel get catalog => _catalog;

  //set catalog
  set catalog(CatalogModel newCatalogModel) {
    assert(newCatalogModel != null); 
    _catalog = newCatalogModel;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get total price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  //add item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}