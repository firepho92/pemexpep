import 'dart:async';
import 'package:flutter/material.dart';

class ViewsProvider with ChangeNotifier {

  int selectedIndex = 0;
  String title = 'Meteorología';
  int mainSelectedIndex = 0;

  void setSelectedIndex(int index) {
    switch (index) {
      case 0:
        setMainSelectedIndex(index);
        break;
      default:
        setMainSelectedIndex(0);
    }
    selectedIndex = index;
    notifyListeners();
  }

  void setMainSelectedIndex(int index) {
    mainSelectedIndex = index;
    notifyListeners();
  }

}