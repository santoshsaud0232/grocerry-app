import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocerry_app/app_state/product_state/cartItem_state.dart';
import 'package:grocerry_app/model/product_details.dart';
import 'package:grocerry_app/custom_widget/custom_button.dart';
import 'package:grocerry_app/custom_widget/five_star_rating_widget.dart';
import 'package:grocerry_app/screens/home/common_pages/custom_snackbar.dart';
import 'package:grocerry_app/screens/home/home_custom/shop/shop_sections/add_remove_btn.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.logout),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              width: width,
              height: height * 0.28,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.elliptical(
                      10,
                      10,
                    ),
                    bottomRight: Radius.elliptical(10, 10)),
              ),
              child: Center(
                child: SizedBox(
                  height: 100,
                  width: 150,
                  child: Image.asset(
                    widget.product.path,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                    cacheWidth: 450,
                    cacheHeight: 300,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.itemName,
                          style: GoogleFonts.aBeeZee().copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //add to favriotue icon
                        Consumer<CartItemsProvider>(
                          builder: (context, value, child) {
                            final itemName = widget.product.itemName;
                            bool isFav = value.favMap[itemName] ?? false;
                            return GestureDetector(
                              onTap: () {
                                value.favriouteItemsList(
                                    widget.product.itemName, widget.product);
                              },
                              child: isFav
                                  ? const Icon(Icons.favorite,
                                      color: Colors.red)
                                  : const Icon(
                                      Icons.favorite_border_outlined,
                                    ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "1kg, price",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer<CartItemsProvider>(
                          builder: (_, value, __) {
                            final counterNumber =
                                value.itemMap[widget.product.itemName] ?? 1;
                            return AddRemoveBtn(
                              itemCount: '$counterNumber',
                              decrementOnTap: () {
                                value.decrementItemCount(
                                    widget.product.itemName);
                              },
                              incrementOnTap: () {
                                value.incrementItemCount(
                                    widget.product.itemName);
                              },
                            );
                          },
                        ),
                        //outer row
                        Text(
                          widget.product.itemPrice,
                          style: GoogleFonts.aBeeZee().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.3,
                  ),

                  //product details texxt
                  Text(
                    'Product details',
                    style: GoogleFonts.aBeeZee().copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    widget.product.itemDetails,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 0.3,
                  ),
                  //nutrition row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nutritions",
                        style: GoogleFonts.aBeeZee().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const Row(
                        children: [
                          Text(
                            "100gm",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: 0.3,
                  ),

                  //Review and rating row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Review",
                        style: GoogleFonts.aBeeZee().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FiveStarRatingWidget(),
                          SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                  //btn to add item to cart
                  Consumer<CartItemsProvider>(
                    builder: (_, value, __) {
                      return CustomButton(
                        btnText: "Add to basket",
                        ontap: () {
                          final alreadyInCart = value.cartItems.any((item) =>
                              item.itemName == widget.product.itemName);
                          if (!alreadyInCart) {
                            value.addToCart(widget.product);
                            showCustomSnackBar(
                                context, "item successfully added to the cart");
                          } else {
                            showCustomSnackBar(
                                context, "item is already added to the cart");
                          }
                        },
                        backgroundColor: Colors.green.shade300,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCustomSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.endToStart,
        content: CustomSnackBar(
          message: message,
        ));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
