import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/app_color.dart';

import '../../../core/my-provider.dart';

class BottomLanguage extends StatelessWidget {
  const BottomLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.chanageLanguage("en");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  local.english,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: provider.localeProvider == "en"
                        ? blueColor
                        : blackColor,
                  ),
                ),
                provider.localeProvider == "en"
                    ? Icon(Icons.done, color: blueColor)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              provider.chanageLanguage("ar");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  local.arabic,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: provider.localeProvider == "ar"
                        ? blueColor
                        : blackColor,
                  ),
                ),
                provider.localeProvider == "ar"
                    ? Icon(Icons.done, color: blueColor)
                    : const SizedBox.shrink(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
