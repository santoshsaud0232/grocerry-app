import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:grocerry_app/app_routes/app_router.dart';
import 'package:grocerry_app/app_state/navigation_bar_state.dart';
import 'package:grocerry_app/app_state/product_state/cartItem_state.dart';
import 'package:grocerry_app/app_state/product_state/filter_cart_state.dart';
import 'package:grocerry_app/app_state/product_state/product_provider.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final productProvider = ProductProvider();
  await productProvider.loadAssets();

  runApp(
    ChangeNotifierProvider.value(
      value: productProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavigationBarState()),
        ChangeNotifierProvider(create: (_) => CartItemsProvider()),
        ChangeNotifierProvider(create: (_) => FilterCartStateProvider())
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter().routes,
        supportedLocales: const [
          Locale("am"),
          Locale("ar"),
          Locale("az"),
          Locale("be"),
          Locale("bg"),
          Locale("bn"),
          Locale("bs"),
          Locale("ca"),
          Locale('ne'),
          Locale("en"),
        ],
        localizationsDelegates: const [
          CountryLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Colors.green,
            onPrimary: Colors.white,
            secondary: Colors.green.shade300,
            onSecondary: Colors.black,
            error: Colors.red,
            onError: Colors.white,
            surface: const Color.fromARGB(255, 255, 255, 255),
            onSurface: Colors.black,
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}
