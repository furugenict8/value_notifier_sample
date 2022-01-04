import 'package:meta/meta.dart';

import 'item.dart';

@immutable
class Cart {
  Cart(this.items);

  final List<Item> items;

  int get totalPrice =>
      //　三項演算子 (条件) ? trueの場合 : falseの場合
      // map(): Iterableの各要素に()内のFunctionを適用して新たにIterableを返すメソッド
      // reduce(): Iterableの最初の要素をvalue（この例だとa）にとり、2つ目以降の要素(例だとb)を順番に引数で渡された関数で処理してvalueに合わせていき、最終的に1つのvalueにまとめる。
      // 以下のコードはmap()でitemsの各要素のpriceのIterableを作り、reduce()でその合計額を返している。
      // Iterable、map()、 reduce()、他Iterableの各メソッドについては以下がわかりやすい。
      // [Flutter] Dartで学ぶイテレータの基礎と、基本的な使い方 https://zenn.dev/tris/articles/61c4a9ca398472
      items.length > 0 ? items.map((a) => a.price).reduce((a, b) => a + b) : 0;
  String get totalPriceWithUnit => '$totalPrice円';

  Cart remove(Item item) {
    // Cartを作り直して返す
    return Cart(
      // where()については引数の条件式を満たす要素のみを取り出して新たなIterableを作る。
      // !expr: inverts the following expression (changes false to true, and vice versa)
      // itemsの中で、idが引数と異なるitemがあった場合はそれを拾って新たにIterableを作る。それをListに変換。
      this.items.where((e) => !e.equals(item)).toList(),
    );
  }
}
