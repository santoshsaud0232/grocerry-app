import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocerry_app/custom_widget/account_listtile.dart';
import 'package:grocerry_app/custom_widget/log_out_btn.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.shopping_bag_outlined,
      Icons.details_rounded,
      Icons.location_on_rounded,
      Icons.payment_outlined,
      Icons.wallet_giftcard_rounded,
      Icons.notifications_rounded,
      Icons.help,
      Icons.dangerous_rounded
    ];
    List<String> title = [
      "order",
      "My Details",
      "Delivery Address",
      "Payment Method",
      "Promo Card",
      "Notifications",
      "Help",
      "About"
    ];
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                child: FlutterLogo(),
              ),
              title: Row(
                children: [
                  Text(
                    "santosh saud",
                    style: GoogleFonts.aBeeZee().copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.edit_outlined,
                      color: Colors.grey,
                      size: 20,
                    ),
                  )
                ],
              ),
              subtitle: Text(
                "santosh@gmail.com",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Divider(
              thickness: 0.4,
              indent: 20,
              endIndent: 20,
            ),
            Flexible(
              flex: 2,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return AccountListTile(
                      titile: title[index],
                      icon: icons[index],
                      onTap: () {},
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 0.4,
                      indent: 20,
                      endIndent: 20,
                    );
                  },
                  itemCount: title.length),
            ),
            CustomLogoutBtn(
              btnTxt: "Log out",
              onTap: () {},
            )
          ],
        ),
      ),
    ));
  }
}
