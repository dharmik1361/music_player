import 'package:flutter/material.dart';

class TabProvider with ChangeNotifier {
  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  void selectTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }
}
