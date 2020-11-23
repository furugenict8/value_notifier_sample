import 'cart.dart';
import 'item.dart';

class CartRepository {
  Future<Cart> get() async {
    return Future.value(Cart([Item('apple', 200), Item('banana', 100)]));
  }
}
