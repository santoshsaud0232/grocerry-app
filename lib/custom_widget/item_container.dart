import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemContainer extends StatelessWidget {
  final String imagePath;
  final String itemTitle;
  void Function()? onTap;

  ItemContainer({
    super.key,
    required this.itemTitle,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.4,
            color: CupertinoColors.inactiveGray,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(imagePath),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              itemTitle,
              style: GoogleFonts.aBeeZee().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
