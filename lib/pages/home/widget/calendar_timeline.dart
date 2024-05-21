/*
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_color.dart';
import '../../../core/my-provider.dart';

class CalendarTimeline extends StatefulWidget {
  CalendarTimeline({super.key});

  @override
  State<CalendarTimeline> createState() => _CalendarTimelineState();
}

class _CalendarTimelineState extends State<CalendarTimeline> {
  var _selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<MyProvider>(context);
    // TODO: implement build
    return DatePicker(
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
    );
  }
}

*/
