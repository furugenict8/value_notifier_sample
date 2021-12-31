import 'package:flutter/material.dart';

import 'cart.dart';
import 'cart_repository.dart';
import 'item.dart';

class CartNotifier extends ValueNotifier<Cart> {
  CartNotifier({@required this.repository}) : super(null) {
    init();
  }

  void init() async {
    // repository.get()からはCartのインスタンスが取得できる
    value = await repository.get();
  }

  void remove(Item item) {
    this.value = value.remove(item);
  }

  final CartRepository repository;
}
