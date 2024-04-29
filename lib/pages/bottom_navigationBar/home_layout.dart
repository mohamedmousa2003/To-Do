import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/pages/home/home_screen.dart';
import 'package:todo/pages/setting/setting_screen.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({super.key});

  static String routeName = "HomeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int indexSelect = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: screens[indexSelect],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexSelect,
        onTap: (index) {
          indexSelect = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.list), label: local.setting),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings), label: local.setting),
        ],
      ),
    );
  }
}
