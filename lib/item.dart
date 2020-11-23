class Item {
  Item(this.id, this.name, this.price);

  final int id;
  final String name;
  final int price;
  String get priceWithUnit => '$price円';

  bool equals(Item item) {
    return id == item.id;
  }
}
