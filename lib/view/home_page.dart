import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ilias/controller/student.dart';
import 'package:ilias/model/student_m.dart';
import 'package:ilias/view/add_student_v.dart';
import 'package:ilias/view/edit_student_v.dart';
import 'package:ilias/view/notification_v.dart';
import 'package:ilias/view/login_v.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RemoteService post = RemoteService();
  List<Student>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getStudent();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
    // String? token = await FirebaseMessaging.instance.getToken();
    // print("Log : $token");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The title text which will be shown on the action bar
          title: const Text('Home Page'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              // onPressed: () => Navigator.of(context).popAndPushNamed('/add'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddStudent()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.notification_important),
              // onPressed: () => Navigator.of(context).popAndPushNamed('/add'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Notifikasi()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.people_alt_rounded),
              // onPressed: () => Navigator.of(context).popAndPushNamed('/add'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyLogin()),
                );
              },
            )
          ],
        ),
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
              itemCount: posts?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditStudent(
                                id: posts![index].id,
                                student_name: posts![index].studentName,
                                student_age: posts![index].studentAge,
                                student_id: posts![index].studentId,
                              )),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                            'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
                      ),
                      title: Text(posts![index].studentName),
                      subtitle: Text(posts![index].studentId),
                      trailing: IconButton(
                          onPressed: () async {
                            bool response =
                                await post.deleteStudentbyID(posts![index].id);
                            if (response) {
                              Navigator.pushReplacementNamed(context, "/home");
                            } else {
                              print('Failed');
                            }
                          },
                          icon: const Icon(Icons.delete)),
                    ),
                  ),
                );
              }),
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
