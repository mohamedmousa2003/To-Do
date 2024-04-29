import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/app_color.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: primaryLight,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 150,
        title: Text(
          local.setting,
          style: theme.textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              local.language,
              style: theme.textTheme.bodyMedium,
            ),
            builderSetting(index: 0, local: local.arabic),
            const SizedBox(height: 20),
            Text(
              local.theme_mode,
              style: theme.textTheme.bodyMedium,
            ),
            builderSetting(index: 1, local: local.dark),
          ],
        ),
      ),
    );
  }

  builderSetting({required int index, required String local}) {
    return InkWell(
      onTap: () {
        index == 0
            ? builderShowModalBottomLanguage()
            : builderShowModalBottomTheme();
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(10),
        height: 60,
        width: double.infinity,
        decoration:
            BoxDecoration(border: Border.all(color: blueColor, width: 3)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(local, style: TextStyle(color: blueColor, fontSize: 20)),
            Icon(
              Icons.arrow_downward,
              color: blueColor,
            ),
          ],
        ),
      ),
    );
  }

  builderShowModalBottomLanguage() {
    return showModalBottomSheet(
        context: context, builder: (context) => Container());
  }

  builderShowModalBottomTheme() {
    return showModalBottomSheet(
        context: context, builder: (context) => Container());
  }
}
