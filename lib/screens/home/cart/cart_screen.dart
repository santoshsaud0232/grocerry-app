import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocerry_app/app_state/product_state/cartItem_state.dart';
import 'package:grocerry_app/custom_widget/custom_button.dart';
import 'package:grocerry_app/screens/home/home_custom/shop/shop_sections/add_remove_btn.dart';
import 'package:grocerry_app/screens/home/home_custom/shop/shop_sections/custom_bottom_sheet.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartItemsProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Text(
                  "My Cart",
                  style: GoogleFonts.aBeeZee().copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.598,
                  child: Consumer<CartItemsProvider>(
                    builder: (context, value, child) {
                      final productList = provider.cartItems;

                      return productList.isEmpty
                          ? const Text(
                              "you have not added any items yet. Cart is empty")
                          : SizedBox(
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    final cartItems = productList[index];

                                    return SizedBox(
                                      height: 100,
                                      width: 360,
                                      child: ListTile(
                                        leading: Image.asset(
                                          cartItems.path,
                                          width: 80,
                                          height: 60,
                                        ),
                                        title: Text(
                                          cartItems.itemName,
                                          style: GoogleFonts.aBeeZee().copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "1kg , price",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                AddRemoveBtn(
                                                  itemCount:
                                                      '${value.itemMap[cartItems.itemName] ?? 1}',
                                                  decrementOnTap: () {
                                                    value.decrementItemCount(
                                                        cartItems.itemName);
                                                  },
                                                  incrementOnTap: () {
                                                    value.incrementItemCount(
                                                        cartItems.itemName);
                                                  },
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    cartItems.itemPrice,
                                                    style: GoogleFonts.aBeeZee()
                                                        .copyWith(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        //close btn for removing items from the cart
                                        trailing: GestureDetector(
                                          onTap: () {
                                            value.removeFromCart(cartItems);
                                          },
                                          child: const Icon(
                                            Icons.close,
                                            size: 26,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      thickness: 0.3,
                                      indent: 17,
                                      endIndent: 17,
                                    );
                                  },
                                  itemCount: productList.length),
                            );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                      btnText: 'Go checkout cart',
                      ontap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return const CustomBottomSheet();
                            });
                      },
                      backgroundColor: Colors.green.shade200),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
