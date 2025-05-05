import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocerry_app/custom_widget/custom_button.dart';

class FilterItemPage extends StatelessWidget {
  const FilterItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close,
                size: 35,
              )),
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,
          title: Text(
            "Filter",
            style: GoogleFonts.aBeeZee().copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                    )),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Categories",
                        style: GoogleFonts.aBeeZee().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            shape: const CircleBorder(),
                            value: true,
                            onChanged: (value) {},
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "eggs",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            shape: const CircleBorder(),
                            value: true,
                            onChanged: (value) {},
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "chips & crips",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            shape: const CircleBorder(),
                            value: false,
                            onChanged: (value) {},
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "meats",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            shape: const CircleBorder(),
                            value: true,
                            onChanged: (value) {},
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "fruits",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Brand",
                        style: GoogleFonts.aBeeZee().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Checkbox(
                            shape: const CircleBorder(),
                            value: false,
                            onChanged: (value) {},
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "fruits",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            shape: const CircleBorder(),
                            value: true,
                            onChanged: (value) {},
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "pahadi bheg",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            shape: const CircleBorder(),
                            value: true,
                            onChanged: (value) {},
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "cocola",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            shape: const CircleBorder(),
                            value: false,
                            onChanged: (value) {},
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "terai bheg",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomButton(
                        btnText: "Apply filter",
                        ontap: () {},
                        backgroundColor: Colors.green.shade300,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
