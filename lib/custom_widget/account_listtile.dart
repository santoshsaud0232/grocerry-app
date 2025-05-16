import 'package:flutter/material.dart';

class AccountListTile extends StatelessWidget {
  final String titile;
  final IconData icon;
  final void Function()? onTap;
  const AccountListTile({
    required this.titile,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 40,
        child: ListTile(
          leading: Icon(icon),
          title: Text(titile),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 20,
          ),
        ),
      ),
    );
  }
}
