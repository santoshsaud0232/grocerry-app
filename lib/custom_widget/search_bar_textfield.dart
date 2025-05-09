import 'package:flutter/material.dart';

class SearchBarTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String text)? onchanged;
  const SearchBarTextField({
    super.key,
    required this.controller,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Container(
        height: 51,
        width: 300,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 223, 228, 233),
            borderRadius: BorderRadius.circular(8)),
        child: TextField(
          onChanged: onchanged,
          controller: controller,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search_outlined),
            hintText: "search store",
            border: UnderlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
