class TaskModel {
  String? id;
  static const String collectionName = "tasks";
  String? title;
  String? description;
  DateTime? date;
  bool? isDone;

  TaskModel({
    this.id = "",
    required this.title,
    required this.description,
    required this.date,
    this.isDone = false,
  });

  // TO CONVERT object to Map<String, dynamic>
  Map<String, dynamic> toJason() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date?.millisecondsSinceEpoch,
      'isDone': isDone,
    };
  }

  // TO CONVERT Map to object

  TaskModel.fromJson(Map<String, dynamic> data)
      : this(
          id: data['id'],
          title: data['title'],
          description: data['description'],
          date: DateTime.fromMillisecondsSinceEpoch(data['date']),
          isDone: data['isDone'],
        );
}
