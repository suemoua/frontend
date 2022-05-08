import 'dart:convert';

class User {
  String? id;
  String? userName;
  String? email;
  String? password;
  bool isAdmin;

  List<User> userModelFromJson(String str) =>
      List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
  User(
      {this.id,
        this.userName,
        this.email,
        this.password,
        this.isAdmin = false});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['_id'],
    userName: json['username'],
    email: json['email'],
    password: json['password'],
    isAdmin: json['isAdmin'],
  );
}