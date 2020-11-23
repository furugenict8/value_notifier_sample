import 'package:flutter/material.dart';

import 'cart.dart';
import 'cart_repository.dart';

class CartNotifier extends ValueNotifier<Cart> {
  CartNotifier({@required this.repository}) : super(null) {
    init();
  }

  void init() async {
    value = await repository.get();
  }

  final CartRepository repository;
}
