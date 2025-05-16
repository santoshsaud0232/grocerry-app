import 'package:flutter/material.dart';

class CustomLogoutBtn extends StatelessWidget {
  final String btnTxt;
  final void Function()? onTap;

  const CustomLogoutBtn({
    super.key,
    required this.btnTxt,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.blue.withValues(
            alpha: 0.2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout),
            SizedBox(
              width: 20,
            ),
            Text(
              "Log out",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
