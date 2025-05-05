import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    return SizedBox(
      width: 369,
      height: 114,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: pageController,
            children: [
              //page1
              bannerMethod(
                image1: Image.asset('assets/images/pngfuel 1.png'),
                image2: Image.asset('assets/images/2771 1.png'),
                title: "Fresh Vegatable",
              ),
              //page2
              bannerMethod(
                  image1: Image.asset('assets/images/2771 1.png'),
                  image2: Image.asset('assets/images/pngfuel 1.png'),
                  title: "just a demo page"),
            ],
          ),
          //indicator
          Positioned(
            bottom: 10,
            child: SmoothPageIndicator(
              controller: pageController,
              count: 4,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.green.shade500,
                dotColor: Colors.green.shade300,
                dotHeight: 8.0,
                dotWidth: 8.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding bannerMethod({
    required Widget image1,
    required Widget image2,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 7, left: 4),
      child: Container(
        width: 369,
        height: 140,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.white,
              Colors.grey.shade300,
            ],
            radius: 1.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            image1,
            Column(
              children: [
                image2,
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Aclonica',
                    fontSize: 13,
                  ),
                ),
                Text(
                  "Get up to 40% off",
                  style: GoogleFonts.aBeeZee().copyWith(
                    color: Colors.green,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/3698 1.png'),
                  Image.asset('assets/images/pngfuel 1.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
