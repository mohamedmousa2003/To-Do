import 'package:flutter/material.dart';

import '../core/app_color.dart';
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.controller,
      required this.title,
      required this.validator,
      this.maxLines});

  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  String title;
  int? maxLines = 1;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: TextFormField(
        controller: controller,
        style: theme.textTheme.bodyMedium,
        validator: validator,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          //hintText: local.enter_your_task,
          label: Text(title),
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
