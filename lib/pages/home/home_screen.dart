import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/app_color.dart';
import 'package:todo/firebase/firebase_manager.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/pages/home/widget/task_widget.dart';

import '../../core/my-provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedValue = DateTime.now();

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
                    child: DatePicker(
                      height: 110,
                      DateTime.now(),
                      initialSelectedDate: _selectedValue,
                      selectionColor: redColor,
                      selectedTextColor: Colors.white,
                      locale: provider.localeProvider,
                      dayTextStyle: const TextStyle(fontSize: 14),
                      dateTextStyle: const TextStyle(fontSize: 25),
                      monthTextStyle: const TextStyle(fontSize: 16),
                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          _selectedValue = date;
                          print(_selectedValue);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            // future لو الحاجه جايه في  futurebuilder بيتم استقبله في
            StreamBuilder(
              stream: FirebaseManager.getTask(_selectedValue),
              builder: (context, snapshot) {
                // if the data It's still coming
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: blueColor,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "error",
                      style: TextStyle(
                        color: redColor,
                        fontSize: 30,
                      ),
                    ),
                  );
                }
                List<TaskModel> tasks = snapshot.data?.docs
                        .map(
                          (e) => e.data(),
                        )
                        .toList() ??
                    [];

                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return TaskWidget(task: tasks[index]);
                    },
                    itemCount: tasks.length,
                  ),
                );
              },
            ),
          ],
        ));
  }
}
