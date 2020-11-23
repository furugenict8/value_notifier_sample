import 'cart.dart';
import 'item.dart';

class CartRepository {
  Future<Cart> get() async {
    return Future.value(Cart([Item(1, 'apple', 200), Item(2, 'banana', 100)]));
  }
}
