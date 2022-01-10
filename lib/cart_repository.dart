import 'cart.dart';
import 'item.dart';

//　カートの保管庫。その通りだと思う。今回はデータベースとか使っていないので、これで作っているってことだろう。
class CartRepository {
  //　非同期関数にしているのは、通常はデータベースとかから持ってくるデータがあるからだと思う。
  Future<Cart> get() async {
    //　今回はデータベースからではなく、実際にデータ直接入れているので、Future.value（）を使っている。
    return Future.value(Cart([Item(1, 'apple', 200), Item(2, 'banana', 100)]));
  }
}
