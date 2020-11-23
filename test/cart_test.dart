import 'package:flutter_test/flutter_test.dart';
import 'package:value_notifier_sample/cart.dart';
import 'package:value_notifier_sample/item.dart';

void main() {
  test('cart total price', () {
    final cart = Cart([Item('grape', 300), Item('orange', 100)]);
    expect(cart.totalPrice, 400);
    expect(cart.totalPriceWithUnit, '400円');
  });
}
