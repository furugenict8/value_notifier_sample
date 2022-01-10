import 'package:flutter/material.dart';

import 'cart.dart';
import 'cart_notifier.dart';
import 'cart_repository.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('カート'),
      ),
      body: CartView(),
    );
  }
}

class CartView extends StatelessWidget {
  //Cartの状態管理をするCartNotifierを作る。
  final cartNotifier = CartNotifier(repository: CartRepository());
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Cart>(
      valueListenable: cartNotifier,
      builder: (context, cart, _) {
        if (cart == null) {
          return const CircularProgressIndicator();
        }
        return Center(
          child: Column(
            children: [
              cart.items.length == 0
                  ? Text('カートは空です。')
                    // 無限に追加できる時に使うListを作るListView.builder
                  : ListView.builder(
                      // shrinkWrap: trueにするとListTileの数に合わせてListを作る
                      shrinkWrap: true,
                      // itemCount: itemの数を表す
                      itemCount: cart.items.length,
                      //　itemBuilder: Listのひとつひとつの要素を作る。Widgetを返すfunctionを入れる。
                      itemBuilder: (context, index) => ListTile(
                        title: Text('${cart.items[index].name}'),
                        subtitle: Text('${cart.items[index].priceWithUnit}'),
                        trailing: FlatButton(
                          onPressed: () {
                            cartNotifier.remove(cart.items[index]);
                          },
                          color: Theme.of(context).accentColor,
                          child: Text('削除'),
                          textColor: Colors.white,
                        ),
                      ),
                    ),
              Text('合計金額: ${cart.totalPriceWithUnit}'),
            ],
          ),
        );
      },
    );
  }
}
