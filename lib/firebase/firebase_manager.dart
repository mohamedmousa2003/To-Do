import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/task_model.dart';

class FirebaseManager {
  static CollectionReference<TaskModel> getTasksCollection() {
    return // FirebaseFirestore.instance.collection('movies').
        FirebaseFirestore.instance
            .collection(TaskModel.collectionName)
            .withConverter<TaskModel>(
              fromFirestore: (snapshot, _) =>
                  TaskModel.fromJson(snapshot.data()!),
              toFirestore: (task, _) => task.toJason(),
            );
  }

  static Future<void> addTask(TaskModel task) async {
    var collectionTask = getTasksCollection(); // collection
    var docRef = collectionTask.doc(); // document
    task.id = docRef.id; // document id
    return await docRef.set(
        task); // take object of task model and take the task and put it in firebase
  }
}
