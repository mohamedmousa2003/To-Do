import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/core/app_color.dart';
import 'package:todo/firebase/firebase_manager.dart';
import 'package:todo/models/task_model.dart';

class TaskWidget extends StatelessWidget {
  TaskModel task;

  TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    bool checkDone = task.isDone!;
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
                FirebaseManager.deleteTask(task.id ?? "");
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
                    color: checkDone ? greenColor : blueColor,
                    borderRadius: BorderRadius.circular(20)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title ?? "",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: checkDone ? greenColor : blueColor,
                    ),
                  ),
                  Text(task.description ?? "",
                      style: checkDone
                          ? theme.textTheme.bodySmall?.copyWith(
                              color: greenColor,
                            )
                          : theme.textTheme.bodySmall?.copyWith(
                              color: blueColor,
                            )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.access_time,
                        color: greyColor,
                      ),
                      Text(
                        "${task.date?.day}/${task.date?.month}/${task.date?.year}",
                        style: theme.textTheme.bodySmall,
                      )
                    ],
                  ),
                ],
              ),
              checkDone
                  ? Container(
                      height: 34,
                      width: 69,
                      decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Done",
                        style: TextStyle(
                          color: whiteColor,
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        task.isDone = true;
                        FirebaseManager.updateTask(task);
                      },
                      child: Container(
                        height: 34,
                        width: 69,
                        decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(
                          Icons.check,
                          color: whiteColor,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
