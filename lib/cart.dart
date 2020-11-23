import 'item.dart';

class Cart {
  Cart(List<Item> items) {
    this.items = items;
  }

  List<Item> items;
  int get totalPrice =>
      items.length > 0 ? items.map((a) => a.price).reduce((a, b) => a + b) : 0;

  String get totalPriceWithUnit => '$totalPrice円';
  int get itemsCount => items.length;

  Cart remove(Item item) {
    return Cart(
      this.items.where((e) => !e.equals(item)).toList(),
    );
  }
}
