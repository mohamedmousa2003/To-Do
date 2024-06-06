import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/my-provider.dart';
import 'package:todo/pages/login/login.dart';
import 'package:todo/pages/setting/widget/BottomLanguage.dart';
import 'package:todo/pages/setting/widget/BottomTheme.dart';

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
    var provider = Provider.of<MyProvider>(context);
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
            builderSetting(
                index: 0,
                local: provider.localeProvider == "en"
                    ? local.english
                    : local.arabic),
            const SizedBox(height: 20),
            Text(
              local.theme_mode,
              style: theme.textTheme.bodyMedium,
            ),
            builderSetting(index: 1, local: local.dark),
            SizedBox(height: 20),
            TextButton(onPressed: (){
              Navigator.popAndPushNamed(context, Login.routName);
            }, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.login_outlined ,color: blueColor,),
                SizedBox(width: 10),
                Text("Logout" ,style:  TextStyle(color: blueColor ,fontSize: 25),),
              ],
            ))
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
        context: context, builder: (context) => BottomLanguage());
  }

  builderShowModalBottomTheme() {
    return showModalBottomSheet(
        context: context, builder: (context) => BottomTheme());
  }
}
