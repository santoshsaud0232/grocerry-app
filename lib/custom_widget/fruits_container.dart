import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class FruitsContainter extends StatelessWidget {
  Widget itemImage;
  final String fruitsName;
  String? price;

  void Function()? onTap;
  void Function()? containerOnTap;
  FruitsContainter({
    required this.itemImage,
    required this.fruitsName,
    this.price,
    this.onTap,
    this.containerOnTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: containerOnTap,
        child: Container(
          width: 173,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(
              color: Colors.black12,
            ),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                itemImage,
                const SizedBox(height: 20),
                Text(
                  fruitsName,
                  style: GoogleFonts.poppins().copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  "1kg, Priceg",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price ?? "",
                      style: const TextStyle(fontSize: 17),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
