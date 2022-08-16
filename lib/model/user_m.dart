// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.username,
    required this.password,
    required this.token,
    required this.id,
  });

  String username;
  String password;
  String token;
  String id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        password: json["password"],
        token: json["token"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "token": token,
        "id": id,
      };
}
