import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo/pages/bottom_navigationBar/home_layout.dart';
import 'package:todo/pages/login/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static String routeName = "splash";

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context,Login.routName);
    });
    return Scaffold(
      body: Image.asset(
        "assets/images/splashLight.png",
        height: mediaQuery.height,
        width: mediaQuery.width,
        fit: BoxFit.fill,
      ),
    );
  }
}
