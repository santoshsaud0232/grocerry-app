import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocerry_app/custom_widget/custom_button.dart';
import 'package:grocerry_app/screens/home/home_custom/shop/home_screen.dart';
import 'package:grocerry_app/screens/home/shop/Home_navigation.dart.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  transform: GradientRotation(0.2),
                  colors: [Color.fromARGB(255, 141, 190, 240), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.3])),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //success cirle
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 90.00,
                      child: CircleAvatar(
                        radius: 75,
                        child: Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              )),
                          child: Image.asset('assets/icons/tick.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Your order has been accepted",
                  style: GoogleFonts.adamina(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    decorationStyle: TextDecorationStyle.dashed,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  "Your item has been placed and is on it's way to being porcessed",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                    btnText: "Track order",
                    ontap: () {},
                    backgroundColor: Colors.green.shade200),

                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ManageNavigationScreen()));
                    },
                    child: Text(
                      "Back to home",
                      style: GoogleFonts.aBeeZee().copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
