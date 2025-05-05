import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("kpg example"),
          bottom: const TabBar(tabs: [
            Tab(
              text: "Wallet Payment",
            ),
            Tab(
              text: " Mobile banking",
            )
          ]),
        ),
        body: Text(""),
      ),
    );
  }
}

class EsewDemo extends StatefulWidget {
  const EsewDemo({super.key});

  @override
  State<EsewDemo> createState() => _EsewDemoState();
}

class _EsewDemoState extends State<EsewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              //example usecase1

              // Example Use case - 1

              )),
    );
  }
}
