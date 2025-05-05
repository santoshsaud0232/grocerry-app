import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomUnderlineTextfield extends StatelessWidget {
  final String labelText;
  bool isObsecure;
  Widget? suffixIcon;
  TextEditingController controller;

  CustomUnderlineTextfield({
    required this.labelText,
    this.isObsecure = false,
    this.suffixIcon,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObsecure,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.background,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }
}
