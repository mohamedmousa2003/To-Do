import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/core/app_color.dart';

class BottomTheme extends StatelessWidget {
  const BottomTheme({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                local.dark,
                style: theme.textTheme.bodyLarge?.copyWith(color: blueColor),
              ),
              Icon(Icons.done, color: blueColor),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                local.light,
                style: theme.textTheme.bodyLarge?.copyWith(color: blackColor),
              ),
              Icon(Icons.done, color: blueColor),
            ],
          )
        ],
      ),
    );
  }
}
