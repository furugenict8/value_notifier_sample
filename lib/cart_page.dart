import 'package:flutter/material.dart';

import 'cart.dart';
import 'cart_notifier.dart';
import 'cart_repository.dart';

class CartPage extends StatelessWidget {
  final cartNotifier = CartNotifier(repository: CartRepository());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('カート'),
      ),
      body: ValueListenableBuilder<Cart>(
        valueListenable: cartNotifier,
        builder: (context, cart, _) {
          if (cart == null) {
            return const CircularProgressIndicator();
          }
          return Center(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) => ListTile(
                      title: Text('${cart.items[index].name}'),
                      subtitle: Text('${cart.items[index].priceWithUnit}')),
                ),
                Text('合計金額: ${cart.totalPriceWithUnit}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
