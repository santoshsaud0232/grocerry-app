import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocerry_app/app_state/product_state/cartItem_state.dart';
import 'package:grocerry_app/custom_widget/custom_button.dart';
import 'package:grocerry_app/screens/home/common_pages/custom_snackbar.dart';
import 'package:provider/provider.dart';

class FavriouteScreen extends StatelessWidget {
  const FavriouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.read<CartItemsProvider>();
    var favlist = provider.favriouteItems;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Favrioute",
              style: GoogleFonts.aBeeZee().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.558,
                child: Consumer<CartItemsProvider>(
                    builder: (context, value, child) {
                  final productList = value.favriouteItems;

                  return productList.isEmpty
                      ? const Text(
                          "you have not yet added your favrioute items",
                          style: TextStyle(color: Colors.black),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  final favItems = productList[index];
                                  return SizedBox(
                                    height: 100,
                                    child: ListTile(
                                      leading: Image.asset(
                                        favItems.path,
                                        width: 70,
                                      ),
                                      title: Text(
                                        favItems.itemName,
                                        style: GoogleFonts.aBeeZee().copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: const Text(
                                        '335ml, price',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      trailing: SizedBox(
                                        width: 80,
                                        child: Row(
                                          children: [
                                            Text(
                                              favItems.itemPrice,
                                              style: GoogleFonts.aBeeZee()
                                                  .copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (_, index) {
                                  return const Divider(
                                    indent: 30,
                                    endIndent: 30,
                                    thickness: 0.3,
                                  );
                                },
                                itemCount: productList.length,
                              ),
                            ),
                            CustomButton(
                              btnText: "Add All to Cart",
                              ontap: () {
                                for (var favItems in favlist) {
                                  provider.addAllFavriouteItemsToCart(favItems);
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        duration: Duration(milliseconds: 300),
                                        content: CustomSnackBar(
                                            message:
                                                "Item added to the cart")));
                              },
                              backgroundColor: Colors.green.shade200,
                            )
                          ],
                        );
                })),
          ]),
        ),
      ),
    );
  }
}
