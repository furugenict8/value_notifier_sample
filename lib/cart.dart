import 'item.dart';

class Cart {
  Cart(List<Item> items) {
    this.items = items;
  }

  List<Item> items;
  int get totalPrice => items.map((a) => a.price).reduce((a, b) => a + b);
  String get totalPriceWithUnit => '$totalPrice円';
  int get itemsCount => items.length;
}
