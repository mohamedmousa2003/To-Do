import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../core/app_color.dart';
class TapText extends StatelessWidget {
  TapText({super.key});
  var titleController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    var theme =Theme.of(context);
    var local = AppLocalizations.of(context)!;
    return Scaffold (
      body:  TextFormField(
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
    );
  }
}
