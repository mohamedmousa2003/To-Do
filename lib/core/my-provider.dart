import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String localeProvider = "en";

  void chanageLanguage(String newLanguage) {
    localeProvider = newLanguage;
    notifyListeners();
  }
}
