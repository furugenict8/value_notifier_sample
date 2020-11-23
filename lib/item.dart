class Item {
  Item(this.name, this.price);
  final String name;
  final int price;
  String get priceWithUnit => '$price円';
}
