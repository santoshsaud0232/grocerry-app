import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;
  const CustomSnackBar({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withValues(),
        ),
        child: Text(
          message,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
