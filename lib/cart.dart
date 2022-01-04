import 'package:meta/meta.dart';

import 'item.dart';

// @immutableは値を直接変更できず、コンストラクタを作り直さないといけない。その宣言をしている。
// Flutter/Dartにおけるimmutableの実践的な扱い方 | by mono  | Flutter 🇯🇵 | Medium https://medium.com/flutter-jp/immutable-d23bae5c29f8
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

  // Cartからitemを取り除くremove()
  Cart remove(Item item) {
    // Cartを作り直して返す
    return Cart(
      // where(): 引数の条件式を満たす要素のみを取り出して新たなIterableを作る。
      // !expr: inverts the following expression (changes false to true, and vice versa)
      //　このeは自分自身のItemであり、itemは引数でとってきたitem
      // 引数のitemと自分の持っているItem eを比べて違っているものだけを抽出したIterableを作り直し、
      // toList()でListにしている。
      //　結果、引数のitemが無いListが作成される。
      this.items.where((e) => !e.equals(item)).toList(),
    );
  }
}
