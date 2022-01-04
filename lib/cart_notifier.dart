import 'package:flutter/material.dart';

import 'cart.dart';
import 'cart_repository.dart';
import 'item.dart';


class CartNotifier extends ValueNotifier<Cart> {
  // CartNotifierのコンストラクタ。空のコンストラクタを作っていると思われる。
  //　CartRepositoryを引数にとる→super(ValueNotifier)のコンストラクタを呼び出し、そこでinit()している。
  // _valueをnullにしているので、空のカートを作っているイメージだと思う。
  CartNotifier({@required this.repository}) : super(null) {
    init();
  }

  // なぜここでasync awaitを使っているのか？
  // →おそらく、repository.get()がasyncを使っているからかな。
  void init() async {
    // repository.get()からはCartのインスタンスが取得できる
    value = await repository.get();
  }

  void remove(Item item) {
    this.value = value.remove(item);
  }

  final CartRepository repository;
}
