import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/core/app_color.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFEC4B4B),
      ),
      child: Slidable(
        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          extentRatio: 0.3,
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),
          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: (context) {
                flex:
                2;
              },
              backgroundColor: redColor,
              foregroundColor: whiteColor,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),

        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 115,
          width: double.infinity,
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 6,
                height: 80,
                decoration: BoxDecoration(
                    color: blueColor, borderRadius: BorderRadius.circular(20)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Play basket ball",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: blueColor,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: greyColor,
                      ),
                      Text(
                        "10:30 Am",
                        style: theme.textTheme.bodySmall,
                      )
                    ],
                  ),
                ],
              ),
              Container(
                height: 34,
                width: 69,
                decoration: BoxDecoration(
                    color: blueColor, borderRadius: BorderRadius.circular(8)),
                child: Icon(
                  Icons.check,
                  color: whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
