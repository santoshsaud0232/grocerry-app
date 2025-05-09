import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocerry_app/app_state/product_state/filter_cart_state.dart';
import 'package:grocerry_app/app_state/product_state/product_provider.dart';
import 'package:grocerry_app/custom_widget/custom_button.dart';
import 'package:provider/provider.dart';

class FilterItemPage extends StatelessWidget {
  const FilterItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    FilterCartStateProvider filterState =
        Provider.of<FilterCartStateProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    final filterMap = filterState.filterItems;
    final filterList = filterState.filterList;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close,
                size: 35,
              )),
          backgroundColor: Theme.of(context).colorScheme.surface,
          centerTitle: true,
          title: Text(
            "Filter",
            style: GoogleFonts.aBeeZee().copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Categories",
                      style: GoogleFonts.aBeeZee().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                        children: List.generate(filterList.length, (index) {
                      return Row(
                        children: [
                          Checkbox(
                            shape: const CircleBorder(),
                            value: filterMap[filterList[index]],
                            onChanged: (value) {
                              filterState.toogleBox(value, filterList[index]);
                            },
                          ),
                          const SizedBox(width: 5),
                          Text(
                            filterList[index],
                            style: const TextStyle(fontSize: 17),
                          ),
                        ],
                      );
                    })),
                    const SizedBox(height: 30),
                    Text(
                      "Brand",
                      style: GoogleFonts.aBeeZee().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          shape: const CircleBorder(),
                          value: false,
                          onChanged: (value) {},
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "fruits",
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          shape: const CircleBorder(),
                          value: false,
                          onChanged: (value) {},
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "pahadi bheg",
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          shape: const CircleBorder(),
                          value: true,
                          onChanged: (value) {},
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "cocola",
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          shape: const CircleBorder(),
                          value: false,
                          onChanged: (value) {},
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "terai bheg",
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomButton(
                      btnText: "Apply filter",
                      ontap: () {
                        if (!filterState.hasSelectedItem()) {
                          // Show snackbar if no filters selected
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Please select at least one filter'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          filterState.applyFilter(productProvider);
                          debugPrint(filterState.filteredItems.toString());
                          Navigator.pop(context);
                        }
                      },
                      backgroundColor: Colors.green.shade300,
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
