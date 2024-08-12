class MyUser {
  String? id;

  static const String collectionName = "users";
  String? email;

  String? name;

  MyUser({required this.id, required this.email, required this.name});

  Map<String, dynamic> toJason() {
    return {
      'id': id,
      'email': email,
      'name': name,
    };
  }

  // TO CONVERT Map to object

  MyUser.fromJson(Map<String, dynamic> data)
      : this(
          id: data['id'],
          email: data['email'],
          name: data['name'],
        );
}
