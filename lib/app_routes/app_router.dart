import 'package:go_router/go_router.dart';
import 'package:grocerry_app/model/product_details.dart';

import 'package:grocerry_app/screens/home/common_pages/custom_item_page.dart';
import 'package:grocerry_app/screens/home/common_pages/filter_item_page.dart';
import 'package:grocerry_app/screens/home/common_pages/product_details.dart';
import 'package:grocerry_app/screens/home/shop/Home_navigation.dart.dart';

class AppRouter {
  final routes = GoRouter(routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: ManageNavigationScreen());
      },
    ),
    GoRoute(
      path: '/product/:name',
      pageBuilder: (context, state) {
        final product = state.extra as Product; //pass the whole product object
        return NoTransitionPage(
          child: ProductDetailScreen(product: product),
        );
      },
    ),
    GoRoute(
      path: '/item/:name',
      builder: (context, state) {
        List<Product>? product =
            state.extra as List<Product>?; //pass the whole object
        return CustomCartItemList(
          product: product,
        );
      },
    ),
    GoRoute(
      path: '/filter',
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: FilterItemPage());
      },
    )
  ]);
}
