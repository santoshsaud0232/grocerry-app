import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:grocerry_app/app_state/product_state/product_provider.dart';
import 'package:grocerry_app/custom_widget/item_container.dart';
import 'package:grocerry_app/custom_widget/search_bar_textfield.dart';
import 'package:provider/provider.dart';

class ExploreProductScreen extends StatefulWidget {
  const ExploreProductScreen({super.key});

  @override
  State<ExploreProductScreen> createState() => _ExploreProductScreenState();
}

class _ExploreProductScreenState extends State<ExploreProductScreen> {
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,
          title: const Text("Find Products"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: SearchBarTextField(
                      controller: controller,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push('/filter');
                    },
                    child: Icon(Icons.tune_rounded),
                  )
                ],
              ),
              Expanded(child:
                  Consumer<ProductProvider>(builder: (context, state, child) {
                final exploreItems = state.product['explore'] ?? [];
                if (state.isLoading) {}
                if (state.message.isNotEmpty) {
                  return Center(child: Text(state.message.toLowerCase()));
                }
                return GridView.builder(
                    itemCount: exploreItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8,
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      //from the provider ref
                      final extraMap = productProvider.product;

                      final myItems =
                          exploreItems[index]; //explore item to display

                      final extralist = extraMap[myItems.itemName];

                      return ItemContainer(
                          itemTitle: myItems.itemName,
                          imagePath: myItems.path,
                          onTap: () async {
                            if (!context.mounted) return;
                            //store the dialog in variable so we can dismis later
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (_) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                });
                            try {
                              await Future.delayed(
                                  const Duration(milliseconds: 500));
                              if (!context.mounted) return;

                              ///dismiss the dialog before navigating
                              Navigator.of(context, rootNavigator: true).pop();
                              if (extraMap.containsKey(myItems.itemName)) {
                                context.push('/item/:${myItems.itemName}',
                                    extra: extralist);
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const DefaultErrorPage()));
                              }
                            } catch (e) {
                              //make sure dialog is dismissed even if there is error
                              Navigator.of(context, rootNavigator: true).pop();
                            }

                            if (!context.mounted) return;
                          });
                    });
              }))
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultErrorPage extends StatelessWidget {
  const DefaultErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Items not found"),
      ),
    );
  }
}
