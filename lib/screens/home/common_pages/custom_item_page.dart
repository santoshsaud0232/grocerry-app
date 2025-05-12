import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocerry_app/custom_widget/fruits_container.dart';
import 'package:grocerry_app/model/product_details.dart';

class CustomCartItemList extends StatelessWidget {
  final List<Product>? product;
  const CustomCartItemList({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final myProduct = product ?? [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(''),
        actions: const [
          Icon(Icons.drag_indicator_rounded),
        ],
      ),
      body: GridView.builder(
          itemCount: myProduct.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            childAspectRatio: 1 / 1.4,
          ),
          itemBuilder: (context, index) {
            final items = myProduct[index];
            return FruitsContainter(
              itemImage: Expanded(
                child: Image.asset(
                  height: 80,
                  width: 100,
                  items.path,
                  fit: BoxFit.contain,
                  cacheWidth: 300,
                  cacheHeight: 252,
                ),
              ),
              fruitsName: items.itemName,
              price: items.itemPrice,
              onTap: () {},
              containerOnTap: () {
                context.push('/product/${items.itemName}', extra: items);
              },
            );
          }),
    );
  }
}
