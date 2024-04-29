import 'package:flutter/material.dart';
import 'package:todo/core/app_color.dart';

class ApplicationTheme {
  static ThemeData themeLight = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: whiteColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: greyColor,
        selectedItemColor: blueColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: blueColor,
          shape: StadiumBorder(
            side: BorderSide(
              color: whiteColor,
              width: 4,
            ),
          )),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 22,
            color: whiteColor,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontSize: 20,
            color: blackColor,
            fontWeight: FontWeight.bold,
          )));
}
