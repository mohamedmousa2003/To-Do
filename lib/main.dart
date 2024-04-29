import 'package:flutter/material.dart';
import 'package:todo/pages/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TO DO',
      initialRoute: SplashScreen.routeName,
      routes: {SplashScreen.routeName: (context) => const SplashScreen()},
    );
  }
}
