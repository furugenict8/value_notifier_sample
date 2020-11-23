import 'package:flutter_test/flutter_test.dart';
import 'package:value_notifier_sample/cart.dart';
import 'package:value_notifier_sample/cart_notifier.dart';
import 'package:value_notifier_sample/cart_repository.dart';
import 'package:value_notifier_sample/item.dart';

void main() {
  test('cart total price', () {
    final cart = Cart([Item('grape', 300), Item('orange', 100)]);
    expect(cart.totalPrice, 400);
    expect(cart.totalPriceWithUnit, '400円');
  });

  test('cart value notifier', () async {
    final cartNotifier = CartNotifier(repository: CartRepository());
    final cart = Cart([Item('grape', 300), Item('orange', 100)]);
    Cart lastValue;
    cartNotifier.addListener(() {
      lastValue = cartNotifier.value;
    });
    cartNotifier.value = cart;
    expect(lastValue, cart);
  });
}
