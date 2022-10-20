import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount{
    return _items == null? 0 :_items.length;
  }

  void addCartItems(String prodId, double myPrice, String myTitle) {
    if (_items.containsKey(prodId)) {
      _items.update(
          prodId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                quantity: existingCartItem.quantity + 1,
                price: existingCartItem.price,
              ));
    } else {
      _items.putIfAbsent(
          prodId,
          () => CartItem(
                id: DateTime.now().toString(),
                title: myTitle,
                price: myPrice,
              ));
    }
    notifyListeners();
  }
}
