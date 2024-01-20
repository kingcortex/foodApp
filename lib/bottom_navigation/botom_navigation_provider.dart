import 'package:flutter/material.dart';

class BottomNAvigationState extends ChangeNotifier {
  int currentIndex = 0;

  void changePage(int index, PageController controller) {
    currentIndex = index;
    controller.jumpToPage(index);
    notifyListeners();
  }
}