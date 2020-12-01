import 'package:meta/meta.dart';

import 'item.dart';

@immutable
class Cart {
  Cart(this.items);

  final List<Item> items;
  int get totalPrice =>
      items.length > 0 ? items.map((a) => a.price).reduce((a, b) => a + b) : 0;
  String get totalPriceWithUnit => '$totalPrice円';

  Cart remove(Item item) {
    return Cart(
      this.items.where((e) => !e.equals(item)).toList(),
    );
  }
}
