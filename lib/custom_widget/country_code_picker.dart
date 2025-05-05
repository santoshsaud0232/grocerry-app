import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';

class CountryCodePickerDemo extends StatelessWidget {
  const CountryCodePickerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CountryCodePicker(
          onChanged: print,
          initialSelection: 'NP',
          favorite: ['+977', 'np'],
          showCountryOnly: false,
          showFlag: true,
          alignLeft: false,
          dialogSize: Size(250, 400),
        ),
      ],
    );
  }
}
