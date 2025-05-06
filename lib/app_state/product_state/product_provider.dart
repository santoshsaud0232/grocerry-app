import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:grocerry_app/model/product_details.dart';

class ProductProvider extends ChangeNotifier {
  bool _isLoading = false;

  String message = '';
  bool get isLoading => _isLoading;
  Map<String, List<Product>> _product = {};
  Map<String, List<Product>> get product => _product;
  List<Product> _filteredList = [];
  List<Product> get filteredList =>
      _filteredList.isEmpty ? _product['explore'] ?? [] : _filteredList;

  Future<void> loadAssets() async {
    _isLoading = true;
    notifyListeners();

    try {
      final jsonString = await rootBundle
          .loadString('assets/product_details/product_details.json');

      final Map<String, dynamic> jsonList = jsonDecode(jsonString);

      final fruitsList = (jsonList['fruits'] as List)
          .map((json) => Product.fromJson(json))
          .toList();

      final bestSellingItems = (jsonList['bestSelling'] as List)
          .map((json) => Product.fromJson(json))
          .toList();

      final exploreItems = (jsonList['explore'] as List)
          .map((json) => Product.fromJson(json))
          .toList();

      final beveragesItems = (jsonList['beverages'] as List)
          .map((json) => Product.fromJson(json))
          .toList();

      final snackItems = (jsonList['snack'] as List)
          .map((json) => Product.fromJson(json))
          .toList();
      final vegetable = (jsonList['vegetable'] as List)
          .map((json) => Product.fromJson(json))
          .toList();
      final dairy = (jsonList['dairy'] as List)
          .map((json) => Product.fromJson(json))
          .toList();
      final meatItems = (jsonList['meat'] as List)
          .map((json) => Product.fromJson(json))
          .toList();

      // Assign only after parsing is successful
      _product = {
        'fruits': fruitsList,
        'bestSelling': bestSellingItems,
        'explore': exploreItems,
        'beverages': beveragesItems,
        'snack': snackItems,
        'fresh vegetable': vegetable,
        'dairy': dairy,
        "meat": meatItems,
      };

      _isLoading = false;
      message = '';
      notifyListeners();
    } catch (e, st) {
      _isLoading = false;
      message = "provider error: $e";
      if (kDebugMode) {
        print("Catch error: $e\n$st");
      }
      notifyListeners();
    }
  }

  //search and filter item in the list
  void searchItems(String query) {
    List<Product> originalList = _product['explore'] ?? [];
    if (query.isEmpty) {
      _filteredList = [];
    } else {
      _filteredList = originalList.where((item) {
        var itemName = item.itemName.toLowerCase();
        final input = query.toLowerCase();
        return itemName.contains(input);
      }).toList();
    }

    notifyListeners();
  }
}
