class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: 'iPhone 12 Pro',
        desc: 'Apple iPhone 12th generation',
        price: 999,
        color: '#33505a',
        image:
            'https://img5.gadgetsnow.com/gd/images/products/additional/large/G201756_View_1/mobiles/smartphones/apple-iphone-12-pro-256-gb-gold-6-gb-ram-.jpg'),
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
