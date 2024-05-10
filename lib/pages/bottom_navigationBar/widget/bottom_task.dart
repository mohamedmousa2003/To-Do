import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/app_color.dart';

class BottomTask extends StatefulWidget {
  @override
  State<BottomTask> createState() => _BottomTaskState();
}

class _BottomTaskState extends State<BottomTask> {
  DateTime dataTime = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var titleController = TextEditingController();
    var descController = TextEditingController();
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              local.add_new_task,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(color: blackColor),
            ),
            TextFormField(
              controller: titleController,
              style: theme.textTheme.bodyMedium,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "please enter your task";
                }
                return null;
              },
              cursorColor: Colors.black,
              decoration: InputDecoration(
                //hintText: local.enter_your_task,
                label: Text(local.task_title),
                labelStyle: theme.textTheme.bodySmall,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: blueColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: blueColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: descController,
              style: theme.textTheme.bodyMedium,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "please enter your description";
                }
                return null;
              },
              maxLines: 3,
              textAlign: TextAlign.justify,
              decoration: InputDecoration(
                //hintText: local.enter_your_description,
                label: Text(local.task_description),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: blueColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: blueColor,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 10),
          Text(
            local.select_time,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          InkWell(
              onTap: () {
                showCalendar();
              },
              child: Text(
                  "${dataTime.day}/${dataTime.month}/${dataTime.year}",
                  textAlign: TextAlign.center,
                  <<<<<<< HEAD
              style: theme.textTheme.bodySmall?.copyWith(color: blueColor),
              =======
          style: theme.textTheme.bodySmall?.copyWith(
              color: blueColor
          ),
          >>>>>>> master
                )),
            const SizedBox(height: 8),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueColor,
                ),
                onPressed: () {
                  _buildAddTask();
                },
                child: Text(local.add, style: theme.textTheme.bodyMedium)),
          ],
        ),
      ),
    );
  }

  showCalendar() async {
    var choseData = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: blueColor, // header background color
              onPrimary: whiteColor, // header text color
              onSurface: blackColor, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: blueColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: dataTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 356)),
    );
    if (choseData != null) {
      dataTime = choseData;
    }
    setState(() {});
  }

  _buildAddTask() {
    if (_formKey.currentState?.validate() == true) {}
  }
}
