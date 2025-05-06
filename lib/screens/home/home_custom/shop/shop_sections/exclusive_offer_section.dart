import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocerry_app/app_state/product_state/product_provider.dart';

import 'package:grocerry_app/custom_widget/fruits_container.dart';
import 'package:provider/provider.dart';

class ExclusiveOfferSection extends StatefulWidget {
  const ExclusiveOfferSection({
    super.key,
  });

  @override
  State<ExclusiveOfferSection> createState() => _ExclusiveOfferSectionState();
}

class _ExclusiveOfferSectionState extends State<ExclusiveOfferSection> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final fruitsList = productProvider.product['fruits'] ?? [];

    if (productProvider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (productProvider.message.isNotEmpty) {
      return Center(
        child: Text("Error Occurred: ${productProvider.message}"),
      );
    }

    if (fruitsList.isEmpty) {
      return const Center(
        child: Text("No products found!"),
      );
    }

    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: fruitsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = fruitsList[index];
          return FruitsContainter(
            containerOnTap: () {
              //navigate with the go router and pass the product
              context.push('/product/${item.itemName}', extra: item);
            },
            itemImage: Expanded(
              child: Image.asset(
                item.path,
                fit: BoxFit.cover,
              ),
            ),
            fruitsName: item.itemName,
            price: item.itemPrice,
            onTap: () {},
          );
        },
      ),
    );
  }
}
