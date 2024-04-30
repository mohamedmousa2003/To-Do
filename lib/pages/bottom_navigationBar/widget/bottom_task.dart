import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/app_color.dart';

class BottomTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    // TODO: implement build
    return Column(children: [
      InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              local.arabic,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: blueColor,
              ),
            ),
            Icon(Icons.done, color: blueColor)
          ],
        ),
      )
    ]);
  }
}
