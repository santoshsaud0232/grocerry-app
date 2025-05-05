import 'package:flutter/material.dart';

class AddRemoveBtn extends StatelessWidget {
  final void Function()? incrementOnTap;
  final void Function()? decrementOnTap;
  final String itemCount;

  const AddRemoveBtn({
    super.key,
    required this.itemCount,
    required this.incrementOnTap,
    required this.decrementOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: decrementOnTap,
            icon: const Icon(
              size: 23.0,
              Icons.remove,
              color: Colors.grey,
            )),
        const SizedBox(width: 3),
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            border: Border.all(width: 0.1),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Text(
            itemCount,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ),
        const SizedBox(width: 3),
        IconButton(
            onPressed: incrementOnTap,
            icon: const Icon(
              size: 20.0,
              Icons.add,
              color: Colors.grey,
            ))
      ],
    );
  }
}
