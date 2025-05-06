import 'package:flutter/material.dart';
import 'package:grocerry_app/custom_widget/search_bar_textfield.dart';
import 'package:grocerry_app/screens/home/home_custom/shop/shop_sections/best_selling_page.dart';
import 'package:grocerry_app/screens/home/home_custom/shop/shop_sections/exclusive_offer_section.dart';
import 'package:grocerry_app/screens/home/home_custom/shop/shop_sections/grocery_section.dart';
import 'package:grocerry_app/screens/home/home_custom/shop/home_sections/home_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/icons/Group.png'),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on),
                    Text(
                      "Kathmandu, nepal",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                //  search bar
                SearchBarTextField(
                  onchanged: (text) {},
                  controller: controller,
                ),
                const SizedBox(height: 20),
                //home  banner
                const HomeBanner(),
                const SizedBox(height: 20),
                //exlcusive offer and see all text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Exculsive offer",
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        "see all",
                        style: TextStyle(color: Colors.green.shade200),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                //exclusive offer section
                const ExclusiveOfferSection(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Best selling",
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        "see all",
                        style: TextStyle(color: Colors.green.shade200),
                      )
                    ],
                  ),
                ),
                //best selling section
                const BestSelling(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Groceries",
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        "see all",
                        style: TextStyle(color: Colors.green.shade200),
                      )
                    ],
                  ),
                ),
                //groceries items section
                const GrocerySection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
