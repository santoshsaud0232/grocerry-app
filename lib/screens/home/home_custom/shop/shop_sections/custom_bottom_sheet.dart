import 'package:flutter/material.dart';
import 'package:grocerry_app/app_state/product_state/cartItem_state.dart';
import 'package:grocerry_app/custom_widget/custom_button.dart';
import 'package:grocerry_app/screens/home/cart/order_success_screen.dart';
import 'package:provider/provider.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void onPressed(BuildContext context) async {
      if (!context.mounted) return;
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator(), Text("Please wait..")],
              ),
            );
          });
    }

    CartItemsProvider provider = Provider.of<CartItemsProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.66,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            ListTile(
              leading: Text(
                "Checkout",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              trailing: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.close,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //Delivery section
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Delivery",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  //select method
                  GestureDetector(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Text(
                          "Select Method",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            //payment section
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "payment",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Icon(
                          Icons.flag,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            //Promo section
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pick discount",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Text(
                          "Pick discount",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            //Total Cost section
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total cost",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "\$ ${provider.totalItemsCost}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(children: [
                  TextSpan(
                      text: " By placing an order you agree to our ",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      )),
                  TextSpan(
                      text: "Terms",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 11,
                      )),
                  TextSpan(
                      text: " and ",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      )),
                  TextSpan(
                      text: "condition",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 11,
                      )),
                ])),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: CustomButton(
                btnText: "Place order",
                ontap: () async {
                  onPressed(context);
                  await Future.delayed(Duration(seconds: 2));

                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => OrderSuccessPage()));
                },
                backgroundColor: Colors.blue.shade200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
