// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

List<Student> studentFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String studentToJson(List<Student> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Student {
  Student({
    required this.studentName,
    required this.studentAge,
    required this.studentId,
    required this.id,
    required this.status,
  });

  String studentName;
  String studentAge;
  String studentId;
  String id;
  String status;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        studentName: json["student_name"],
        studentAge: json["student_age"],
        studentId: json["student_id"],
        id: json["id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "student_name": studentName,
        "student_age": studentAge,
        "student_id": studentId,
        "id": id,
        "status": status,
      };
}
