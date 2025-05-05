import 'package:flutter/material.dart';
import 'package:grocerry_app/custom_widget/custom_button.dart';
import 'package:grocerry_app/custom_widget/custom_underline_textifeild.dart';
import 'package:grocerry_app/screens/auth_screens/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
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
                "Loging",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
              ),
              const Text(
                "Enter your email and password",
                style: TextStyle(color: Colors.grey),
              ),
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SignUpScreen()));
                    },
                    child: RichText(
                        text: const TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: [
                          TextSpan(
                              text: "Sign up.",
                              style: TextStyle(color: Colors.blue))
                        ])),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
