// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:grocerry_app/model/product_details.dart';

class CartItemsProvider extends ChangeNotifier {
  final List<Product> _cartItems = [];
  List<Product> get cartItems => _cartItems;
  final Map<String, int> _itemMap = {};
  Map<String, int> get itemMap => _itemMap;
  double _totalItemsCost = 0;
  double get totalItemsCost => _totalItemsCost;

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
    //total amount of the items in the carts
    String cleanedPrice = product.itemPrice.replaceAll(RegExp(r'[^\d.]'), '');
    var itemCost = double.tryParse(cleanedPrice) ?? 0.0;
    _totalItemsCost = itemCost + _totalItemsCost;

    notifyListeners();
  }

  void totalPriceOfCartItems() {}

  void removeFromCart(Product itemName) {
    _cartItems.remove(itemName);
    //subtract the items price from the cart
    String cleanedPrice = itemName.itemPrice.replaceAll(RegExp(r'[^\d.]'), '');
    var itemCost = double.tryParse(cleanedPrice) ?? 0.0;
    _totalItemsCost -= itemCost;
    notifyListeners();
  }

  void favriouteItemsList(String productName, Product product) {
    // add item to the map and invert the value
    _favMap[productName] = !(_favMap[productName] ?? false);

    if (_favMap[productName]!) {
      _favriouteItems.add(product);
    } else {
      _favriouteItems.remove(product);
    }

    notifyListeners();
  }

  void addAllFavriouteItemsToCart(Product product) {
    if (!_cartItems.contains(product)) {
      _cartItems.addAll(_favriouteItems);
      String cleanedPrice = product.itemPrice.replaceAll(RegExp(r'[^\d.]'), '');
      var itemCost = double.tryParse(cleanedPrice) ?? 0.0;
      _totalItemsCost += itemCost;
    }

    notifyListeners();
  }
}
