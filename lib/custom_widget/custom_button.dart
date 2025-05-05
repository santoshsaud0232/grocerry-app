import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  void Function()? ontap;
  final String btnText;
  final Color? backgroundColor;
  IconData? btnIcon;

  CustomButton({
    super.key,
    required this.btnText,
    required this.ontap,
    required this.backgroundColor,
    this.btnIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(353, 67),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              btnIcon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              btnText,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
