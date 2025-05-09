import 'package:flutter/material.dart';
import 'package:grocerry_app/app_state/product_state/product_provider.dart';
import 'package:grocerry_app/model/filter_cart_model.dart';
import 'package:grocerry_app/model/product_details.dart';

class FilterCartStateProvider extends ChangeNotifier {
  final List<String> _filterList = FilterCartModel.categories;
  List<String> get filterList => _filterList;
  final Map<String, bool> _filterItems = {};
  Map<String, bool> get filterItems => _filterItems;

  final Map<String, List<Product>> _filteredItems = {};
  Map<String, List<Product>> get filteredItems => _filteredItems;

  //instance of product provider

  //initialize all the item to false
  FilterCartStateProvider() {
    for (var item in _filterList) {
      _filterItems[item] = false;
    }
  }

  void toogleBox(bool? value, String items) {
    _filterItems[items] = value!;
    notifyListeners();
  }

  //returns true if any of the items in the map is true
  bool hasSelectedItem() {
    return _filterItems.values.any((isSlected) => isSlected);
  }

  void clearFilters() {
    for (var key in _filterItems.keys) {
      _filterItems[key] = false;
    }
    _filteredItems.clear();
    notifyListeners();
  }

  void applyFilter(ProductProvider productProvider) {
    //get all product items
    final allExploreItems = productProvider.product['explore'] ?? [];
    if (!hasSelectedItem()) {
      return;
    }
    //selected filteres items
    final selectedExploreItems = _filterItems.entries.where((entry) {
      return entry.value == true;
    }).map((entry) {
      return entry.key;
    }).toList();

    if (selectedExploreItems.isEmpty) {
      _filteredItems['explore'] = allExploreItems;
    } else {
      //filter items that matches any of the selected explore items
      _filteredItems['explore'] = allExploreItems.where((product) {
        return selectedExploreItems.any((category) {
          //checks if they are equl
          return product.itemName.toLowerCase() == category.toLowerCase();
        });
      }).toList();
    }
    notifyListeners();
  }
}
