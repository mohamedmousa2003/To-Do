import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/app_color.dart';
import 'package:todo/pages/home/widget/calendar_timeline.dart';
import 'package:todo/pages/home/widget/task_widget.dart';

import '../../core/my-provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<MyProvider>(context);
    var local = AppLocalizations.of(context)!;
    // TODO: implement build
    return Scaffold(
        backgroundColor: primaryLight,
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 215,
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    alignment: Alignment.center,
                    color: blueColor,
                    child: Text(local.title, style: theme.textTheme.bodyLarge),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: CalendarTimeline()),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return TaskWidget();
                },
              ),
            ),
          ],
        ));
  }
}
