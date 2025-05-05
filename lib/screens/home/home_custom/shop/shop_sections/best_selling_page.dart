import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocerry_app/app_state/product_state/product_provider.dart';
import 'package:grocerry_app/custom_widget/fruits_container.dart';
import 'package:provider/provider.dart';

class BestSelling extends StatefulWidget {
  const BestSelling({
    super.key,
  });

  @override
  State<BestSelling> createState() => _BestSellingState();
}

class _BestSellingState extends State<BestSelling> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     Provider.of<ProductProvider>(context, listen: false).loadAssets();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, state, child) {
      final providerItems = state.product['bestSelling'] ?? [];
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state.message.isNotEmpty) {
        return Center(
          child: Text(state.message.toString()),
        );
      }
      return SizedBox(
        height: 240,
        child: ListView.builder(
          itemCount: providerItems.length,
          itemBuilder: (context, index) {
            final bestSellingItems = providerItems[index];

            return FruitsContainter(
              containerOnTap: () {
                context.push('/product/${bestSellingItems.itemName}',
                    extra: bestSellingItems);
              },
              itemImage: Flexible(
                child: Image.asset(
                  bestSellingItems.path,
                ),
              ),
              fruitsName: bestSellingItems.itemName,
              price: bestSellingItems.itemPrice,
              onTap: () {},
            );
          },
          scrollDirection: Axis.horizontal,
        ),
      );
    });
  }
}
