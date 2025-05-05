import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocerry_app/custom_widget/custom_button.dart';
import 'package:grocerry_app/custom_widget/custom_underline_textifeild.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObsecure = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset('assets/icons/Group.png')),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Sign up",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
            ),
            const Text(
              "Enter your credential to continue",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomUnderlineTextfield(
                labelText: "username", controller: usernameController),
            const SizedBox(
              height: 20,
            ),

            //custom underline textfield
            CustomUnderlineTextfield(
              controller: emailController,
              labelText: "Email",
            ),
            const SizedBox(height: 30),
            //password textfield
            CustomUnderlineTextfield(
              controller: passwordController,
              labelText: "Enter password",
              isObsecure: isObsecure,
              suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isObsecure = !isObsecure;
                    });
                  },
                  child: isObsecure
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility)),
            ),
            const SizedBox(
              height: 20,
            ),
            //forgot passowrd
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {},
                child: const Text("forgot password?"),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            //log in btn
            CustomButton(
                btnText: 'log in',
                ontap: () {},
                backgroundColor: Colors.blueGrey),

            Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {},
                  child: RichText(
                      text: const TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                        TextSpan(
                            text: "log in.",
                            style: TextStyle(color: Colors.blue))
                      ])),
                ))
          ],
        ),
      ),
    ));
  }
}
