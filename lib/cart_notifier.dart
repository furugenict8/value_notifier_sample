import 'package:flutter/material.dart';

import 'cart.dart';
import 'cart_repository.dart';
import 'item.dart';


// Cartの状態管理をするValueNotifier
class CartNotifier extends ValueNotifier<Cart> {
  // CartNotifierのコンストラクタ。空のコンストラクタを作っていると思われる。
  //　CartRepositoryを引数にとる→super(ValueNotifier)のコンストラクタを呼び出し、そこでinit()している。
  // _valueをnullにしているので、空のカートを作っているイメージだと思う。
  CartNotifier({@required this.repository}) : super(null) {
    init();
  }

  // なぜここでasync awaitを使っているのか？
  // →おそらく、repository.get()がasyncを使っているからかな。
  // valueはValueNotifierで定義されているfield。Genericsで指定されているインスタンスが入る。
  // 今回はCart
  // つまり、以下ではValueNotifierで監視しているCartを初期化している。
  void init() async {
    // repository.get()からはCartのインスタンスが取得できる
    value = await repository.get();
  }

  // valueはValueNotifierのvalueであり、Cartが入っている。
  // Cartのremove()をして、valueに再代入。
  // Cartのremove()は、
  // List itemsから引数のitemを削除し、List itemsを作り直す。
  void remove(Item item) {
    this.value = value.remove(item);
  }

  final CartRepository repository;
}
