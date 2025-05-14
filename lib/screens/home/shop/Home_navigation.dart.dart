import 'package:flutter/material.dart';
import 'package:grocerry_app/app_state/navigation_bar_state.dart';
import 'package:grocerry_app/model/product_details.dart';

import 'package:grocerry_app/screens/home/accounts/account_screen.dart';
import 'package:grocerry_app/screens/home/cart/cart_screen.dart';
import 'package:grocerry_app/screens/home/explore/explore_screen.dart';
import 'package:grocerry_app/screens/home/favrioute/favriuote_screen.dart';
import 'package:grocerry_app/screens/home/home_custom/shop/home_screen.dart';
import 'package:provider/provider.dart';

class ManageNavigationScreen extends StatefulWidget {
  const ManageNavigationScreen({
    super.key,
  });

  @override
  State<ManageNavigationScreen> createState() => _ManageNavigationScreenState();
}

class _ManageNavigationScreenState extends State<ManageNavigationScreen> {
  List<BottomNavigationBarItem> navigationItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.shop), label: "shop"),
    BottomNavigationBarItem(icon: Icon(Icons.manage_search), label: "explore"),
    BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), label: "cart"),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border_rounded), label: "favourite"),
    BottomNavigationBarItem(
        icon: Icon(Icons.person_2_outlined), label: "account"),
  ];
  // all screen list for navigation bar
  List<Widget> screens = [
    HomeScreen(),
    ExploreProductScreen(),
    CartScreen(),
    FavriouteScreen(),
    AccountScreen(),
  ];

  // int selectedIndex = 0;

  // void onTapNavigation(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: IndexedStack(
              index: context.watch<BottomNavigationBarState>().selectedIndex,
              children: screens,
            ),
            bottomNavigationBar: Consumer<BottomNavigationBarState>(
              builder: (context, value, child) {
                return BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.grey.shade200,
                  selectedItemColor: Colors.green,
                  items: navigationItems,
                  currentIndex: value.selectedIndex,
                  onTap: value.onTapNavigation,
                );
              },
            )));
  }
}
