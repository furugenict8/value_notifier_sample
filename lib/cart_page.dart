import 'package:flutter/material.dart';

import 'cart.dart';
import 'cart_notifier.dart';
import 'cart_repository.dart';

class CartPage extends StatelessWidget {
  final cartNotifier = CartNotifier(repository: CartRepository());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Cart>(
        valueListenable: cartNotifier,
        builder: (context, value, _) {
          if (value == null) {
            return const CircularProgressIndicator();
          }
          return Center(
            child: Column(
              children: [
                ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                      title: Text('${value.items[index].name}'),
                      subtitle: Text('${value.items[index].price}')),
                ),
                Text('合計金額: ${value.totalPrice}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
