import 'package:flutter/material.dart';
import 'package:ilias/controller/student.dart';

class EditStudent extends StatefulWidget {
  final String id;
  final String student_name;
  final String student_age;
  final String student_id;

  const EditStudent({
    Key? key,
    required this.id,
    required this.student_name,
    required this.student_age,
    required this.student_id,
  }) : super(key: key);

  @override
  _EditStudentState createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  RemoteService put = RemoteService();

  var _id = TextEditingController();
  var _student_name = TextEditingController();
  var _student_age = TextEditingController();
  var _student_id = TextEditingController();
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    // getData();
    _id.text = widget.id;
    _student_name.text = widget.student_name;
    _student_age.text = widget.student_age;
    _student_id.text = widget.student_id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: const Text('Edit Student'),
      ),
      body: Container(
        child: Column(children: [
          TextField(
              controller: _student_name,
              decoration: InputDecoration(hintText: 'Student Name')),
          TextField(
              controller: _student_age,
              decoration: InputDecoration(hintText: 'Student Age')),
          TextField(
              controller: _student_id,
              decoration: InputDecoration(hintText: 'Student ID')),
          ElevatedButton(
              onPressed: () async {
                bool response = await put.putStundent(_id.text,
                    _student_name.text, _student_age.text, _student_id.text);
                if (response) {
                  Navigator.pushReplacementNamed(context, "/home");
                } else {
                  print('Failed');
                }
              },
              child: Text('Submit'))
        ]),
      ),
    );
  }
}
