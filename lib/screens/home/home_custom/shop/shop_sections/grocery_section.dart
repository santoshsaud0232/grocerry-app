import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class GrocerySection extends StatelessWidget {
  const GrocerySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildGrocery(
            imagePath: 'assets/grocery/pulses.png',
            groceryText: "Pulses",
          ),
          buildGrocery(
            imagePath: 'assets/grocery/rice.png',
            groceryText: "rice",
          ),
          buildGrocery(
            imagePath: 'assets/images/2771 1.png',
            groceryText: "friuts",
          ),
        ],
      ),
    );
  }

  Padding buildGrocery(
      {required String imagePath, required String groceryText}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 248,
        height: 105,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 235, 229, 182),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(imagePath),
            Text(
              groceryText,
              style: GoogleFonts.aBeeZee(),
            )
          ],
        ),
      ),
    );
  }
}
