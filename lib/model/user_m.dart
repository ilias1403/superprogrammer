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
    required this.userId,
    required this.name,
    required this.username,
    required this.password,
    required this.userStatus,
    required this.fcmToken,
    required this.dtUpdated,
    required this.dtAdded,
  });

  String userId;
  String name;
  String username;
  String password;
  String userStatus;
  dynamic fcmToken;
  DateTime dtUpdated;
  DateTime dtAdded;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        name: json["name"],
        username: json["username"],
        password: json["password"],
        userStatus: json["user_status"],
        fcmToken: json["fcm_token"],
        dtUpdated: DateTime.parse(json["dt_updated"]),
        dtAdded: DateTime.parse(json["dt_added"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "username": username,
        "password": password,
        "user_status": userStatus,
        "fcm_token": fcmToken,
        "dt_updated": dtUpdated.toIso8601String(),
        "dt_added": dtAdded.toIso8601String(),
      };
}
