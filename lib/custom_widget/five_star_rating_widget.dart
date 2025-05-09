import 'package:flutter/material.dart';

class FiveStarRatingWidget extends StatefulWidget {
  const FiveStarRatingWidget({super.key});

  @override
  State<FiveStarRatingWidget> createState() => _FiveStarRatingWidgetState();
}

class _FiveStarRatingWidgetState extends State<FiveStarRatingWidget> {
  int starLength = 5;
  int ratingState = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(starLength, (index) {
        return GestureDetector(
          child: index < ratingState
              ? const Icon(
                  Icons.star,
                  color: Colors.yellow,
                )
              : const Icon(Icons.star_outline_outlined),
          onTap: () {
            setState(() {
              ratingState = index + 1;
            });
          },
        );
      }),
    );
  }
}
