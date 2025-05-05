import 'package:flutter/material.dart';
import 'package:grocerry_app/custom_widget/custom_button.dart';
import 'package:grocerry_app/screens/auth_screens/sign_in_screen.dart';

class WelComeScreen extends StatelessWidget {
  const WelComeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: -50,
              child: Image.asset(
                'assets/images/8140 1.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 90),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      textAlign: TextAlign.center,
                      "  Welcome\nto our store! ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            color: Colors.black,
                            blurRadius: 3.0,
                          ),
                          Shadow(
                            offset: Offset(-2.0, -2.0),
                            color: Colors.black,
                            blurRadius: 3.0,
                          )
                        ],
                      ),
                    ),
                    const Text(
                      "get your groceries as fast as one hour",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    const SizedBox(height: 17),
                    CustomButton(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      btnText: "Get started",
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SignInScreen()));
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
