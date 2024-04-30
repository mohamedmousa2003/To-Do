import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String localeProvider = "ar";

  void chanageLanguage(String newLanguage) {
    localeProvider = newLanguage;
    notifyListeners();
  }
}
