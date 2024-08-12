import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/my_user.dart';
import 'package:todo/models/task_model.dart';

class FirebaseManager {
  static CollectionReference<TaskModel> getTasksCollection() {
    return // FirebaseFirestore.instance.collection('movies').
        FirebaseFirestore.instance
            .collection(TaskModel.collectionName)
            .withConverter<TaskModel>(
              fromFirestore: (snapshot, _) =>
                  TaskModel.fromJson(snapshot.data()!), // convert map to object
              toFirestore: (task, _) =>
                  task.toJason(), //convert object to map <String, dynamic>
            );
  }

  static Future<void> addTask(TaskModel task) async {
    var docRef = getTasksCollection().doc(); // collection and // document
    task.id = docRef.id; // document id
    return await docRef.set(
        task); // take object of task model and take the task and put it in firebase
  }

// delete function
  static void deleteTask(String id) {
    getTasksCollection().doc(id).delete();
  }

// update function
  static void updateTask(TaskModel task) {
    getTasksCollection().doc(task.id).update(task.toJason());
  }

  // function to read task
  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime dateTime) {
    return getTasksCollection()
        .where("date",
            isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
        .snapshots();
  }

  // create collection MyUser as to make user to local fireStore
  static CollectionReference<MyUser> getUsersCollection() {
    return // FirebaseFirestore.instance.collection('movies').
        FirebaseFirestore.instance
            .collection(MyUser.collectionName)
            .withConverter<MyUser>(
              // MyUser الحاجه اللي بخزنه
              fromFirestore: (snapshot, options) =>
                  MyUser.fromJson(snapshot.data()!), // convert map to object
              toFirestore: (user, options) =>
                  user.toJason(), //convert object to map <String, dynamic>
            );
  }

  //عاوز اجيب user من fireStore
  // used in register
  static Future<void> addUserToFireStore(MyUser myUser) {
    return getUsersCollection().doc(myUser.id).set(myUser);
  }
}
