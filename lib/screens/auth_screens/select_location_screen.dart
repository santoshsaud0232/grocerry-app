import 'package:flutter/material.dart';
import 'package:grocerry_app/custom_widget/custom_button.dart';

class SelectLocationScreen extends StatelessWidget {
  const SelectLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset('assets/icons/map.png'),
              const SizedBox(height: 20),
              const Text(
                "Select your location",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 5),
              const Text(
                "switch on your location to stay tune with whats happening in your area",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  color: Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const InputDecorator(
                  decoration: InputDecoration(),
                  child: ListTile(
                    title: Text(
                      'your zone',
                    ),
                    titleTextStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    subtitle: Text("Tikapur"),
                    trailing: Icon(Icons.arrow_drop_down_circle_rounded),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: const InputDecorator(
                  decoration: InputDecoration(
                    hintText: "types of your area",
                  ),
                  child: ListTile(
                    title: Text(
                      'your area',
                    ),
                    titleTextStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    subtitle: Text("Types of your area"),
                    trailing: Icon(Icons.arrow_drop_down_circle_rounded),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(
                  btnText: 'Submit',
                  ontap: () {},
                  backgroundColor: Colors.blueGrey),
            ],
          ),
        ),
      ),
    );
  }
}
