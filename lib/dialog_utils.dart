import 'package:flutter/material.dart';
import 'package:todo/core/app_color.dart';

class DialogUtils {
  // show load
  static void showLoading(BuildContext context, String text) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(
                backgroundColor: blueColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(text),
            ],
          ),
        );
      },
    );
  }

  // hide loading
  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  // show message
  static void ShowMessage(
    BuildContext context,
    String messageContent, {
    String? messageTitle,
    String? posActionName,
    Function? onPressedPosActionName,
    String? negActionName,
    Function? onPressedNegActionName,
    bool barrierDismissible = true,
    TextStyle? titleTextStyle,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            onPressedPosActionName?.call();
          },
          child: Text(posActionName)));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            onPressedNegActionName?.call();
          },
          child: Text(negActionName)));
    }
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(messageContent),
          title: Text(messageTitle ?? "title"),
          titleTextStyle: titleTextStyle,
          actions: actions,
        );
      },
    );
  }
}
