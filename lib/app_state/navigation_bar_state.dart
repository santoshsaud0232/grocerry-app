import 'package:flutter/material.dart';

class BottomNavigationBarState extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void onTapNavigation(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
