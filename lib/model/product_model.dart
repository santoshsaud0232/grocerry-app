import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocerry_app/model/product_details.dart';

class ProductModel {
  ProductModel();
  static Future<Map<String, List<Product>>> loadAssets() async {
    Map<String, List<Product>> parsedMap = {};
    try {
      String jsonString = await rootBundle
          .loadString('assets/product_details/product_details.json');
      final rawJsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      if (rawJsonMap.containsKey('fruits')) {
        final fruitsProduct = (rawJsonMap['fruits'] as List)
            .map((json) => Product.fromJson(json))
            .toList();
        parsedMap['fruits'] = fruitsProduct;
      }
      if (rawJsonMap.containsKey('bestSelling')) {
        final fruitsProduct = (rawJsonMap['bestSelling'] as List)
            .map((json) => Product.fromJson(json))
            .toList();
        parsedMap['bestSelling'] = fruitsProduct;
      }
      if (rawJsonMap.containsKey('explore')) {
        final fruitsProduct = (rawJsonMap['explore'] as List)
            .map((json) => Product.fromJson(json))
            .toList();
        parsedMap['explore'] = fruitsProduct;
      }
      return parsedMap;
    } catch (e) {
      debugPrint("Error accured in the loadAsset : $e");
      return {};
    }
  }
}
