import 'package:flutter/material.dart';
import 'package:grocerry_app/custom_widget/country_code_picker.dart';
import 'package:grocerry_app/custom_widget/custom_button.dart';
import 'package:grocerry_app/screens/auth_screens/login_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CountryCodePickerDemo countryCodePickerDemo = const CountryCodePickerDemo();
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Positioned(
                  right: -30,
                  child: Image.asset('assets/images/Mask Group.png'),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Get your groceries\n with nector",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        labelText: "Enter phone number",
                        prefixIconConstraints: const BoxConstraints(
                          maxWidth: 40,
                          maxHeight: 40,
                        ),
                        prefix: countryCodePickerDemo,
                        border: const OutlineInputBorder()),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Or connect with social media",
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    btnIcon: Icons.search,
                    btnText: "continue with google",
                    ontap: () {},
                    backgroundColor: const Color.fromARGB(255, 19, 149, 214),
                  ),
                  const SizedBox(height: 15),
                  CustomButton(
                    btnIcon: Icons.facebook,
                    btnText: "continue with google",
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginScreen()));
                    },
                    backgroundColor: const Color.fromARGB(255, 98, 139, 160),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
