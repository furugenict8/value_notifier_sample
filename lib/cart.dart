import 'package:meta/meta.dart';

import 'item.dart';

@immutable
class Cart {
  Cart(this.items);


  final List<Item> items;
  int get totalPrice =>
      //　三項演算子 (条件) ? trueの場合 : falseの場合
      // itemのmap()
      // map()は()内のFunctionを実行して、戻ったTをtoElementでelementに変換し、Iterableにまとめて戻すメソッド。
      items.length > 0 ? items.map((a) => a.price).reduce((a, b) => a + b) : 0;
  String get totalPriceWithUnit => '$totalPrice円';

  Cart remove(Item item) {
    return Cart(
      this.items.where((e) => !e.equals(item)).toList(),
    );
  }
}
