import 'package:flutter/material.dart';
import 'package:ilias/controller/student.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  RemoteService post = RemoteService();
  final _student_name = TextEditingController();
  final _student_age = TextEditingController();
  final _student_id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.arrow_left_sharp),
        //     onPressed: () => Navigator.of(context).popAndPushNamed('/home'),
        //   )
        // ],
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
                bool response = await post.postStundent(
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
