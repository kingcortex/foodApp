import 'package:flutter/material.dart';

class HomeFilterState extends ChangeNotifier {
  String currentTitle = "All";
  String currentSubTile = "All";

  void changeTitle(String title) {
    if (title != currentTitle) {
      currentTitle = title;
      notifyListeners();
    }
  }

  void changeSubTile(String title) {
    if (title != currentSubTile) {
      currentSubTile = title;
      notifyListeners();
    }
  }
}