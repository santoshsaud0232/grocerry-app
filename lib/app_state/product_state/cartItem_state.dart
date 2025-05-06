import 'package:flutter/cupertino.dart';
import 'package:grocerry_app/model/product_details.dart';

class CartItemsProvider extends ChangeNotifier {
  final List<Product> _cartItems = [];
  List<Product> get cartItems => _cartItems;
  final Map<String, int> _itemMap = {};
  Map<String, int> get itemMap => _itemMap;

  // bool _isFav = false;
  // bool get isFav => _isFav;
  final Map<String, bool> _favMap = {};
  Map<String, bool> get favMap => _favMap;
  //favrioute item list
  final List<Product> _favriouteItems = [];
  List<Product> get favriouteItems => _favriouteItems;

  void incrementItemCount(String productName) {
    _itemMap[productName] = (_itemMap[productName] ?? 1) + 1;
    cartItems;
    notifyListeners();
  }

  void decrementItemCount(String productName) {
    cartItems;
    if (_itemMap.containsKey(productName)) {
      if (_itemMap[productName]! > 1) {
        _itemMap[productName] = _itemMap[productName]! - 1;
      }
    }
    notifyListeners();
  }

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product itemName) {
    _cartItems.remove(itemName);
    notifyListeners();
  }

  void favriouteItemsList(String productName, Product product) {
    // add item to the map and invert the value
    _favMap[productName] = !(_favMap[productName] ?? false);

    if (_favMap[productName]!) {
      favriouteItems.add(product);
    } else {
      favriouteItems.remove(product);
    }

    notifyListeners();
  }
}
