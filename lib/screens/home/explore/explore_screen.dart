import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:grocerry_app/app_state/product_state/filter_cart_state.dart';
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
  late TextEditingController _controller;

  bool loading = true;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  //searching item in the list
  void searchItem(String text) {}
  @override
  Widget build(BuildContext context) {
    FilterCartStateProvider filterState =
        Provider.of<FilterCartStateProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    //display filtered items if available or else display product[explore ] items
    final itemToDisplay = filterState.filteredItems['explore'] ??
        productProvider.product['explore'] ??
        [];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: filterState.clearFilters,
              child: const Icon(Icons.arrow_back)),
          backgroundColor: Theme.of(context).colorScheme.surface,
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
                      onchanged: (text) {
                        productProvider.searchItems(text);
                      },
                      controller: _controller,
                    ),
                  ),
                  //filter list
                  GestureDetector(
                    onTap: () {
                      context.push('/filter');
                    },
                    child: const Icon(Icons.tune_rounded),
                  )
                ],
              ),
              Expanded(child:
                  Consumer<ProductProvider>(builder: (context, state, child) {
                if (state.message.isNotEmpty) {
                  return Center(child: Text(state.message.toLowerCase()));
                }
                return GridView.builder(
                    itemCount: itemToDisplay.length,
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
                          itemToDisplay[index]; //explore item to display

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
