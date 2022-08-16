import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ilias/main.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({Key? key}) : super(key: key);

  @override
  _NotifikasiState createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  @override
  void initState() {
    super.initState();
    getToken();
  }

  getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: const Text('Notification'),
      ),
      // body: FutureBuilder(
      //   future: pegaDados(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       print(snapshot.data);
      //       // return Container(
      //       //   child: ListView.builder(
      //       //     itemBuilder: (context, index) {
      //       //       return ListTile(
      //       //         leading: Image.asset(
      //       //           "assets/" + snapshot.data[index]['imagem'],
      //       //           fit: BoxFit.contain,
      //       //         ),
      //       //         title: Text(snapshot.data[index]['pedido']),
      //       //         trailing: Text(snapshot.data[index]['valor']),
      //       //       );
      //       //     },
      //       //   ),
      //       // );
      //     } else if (snapshot.hasError) {
      //       print("error");
      //     } else {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
      // body: const Center(
      //   child: Text("Push Notification"),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     String? token = await FirebaseMessaging.instance.getToken();
      //     print('Token: $token');
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
