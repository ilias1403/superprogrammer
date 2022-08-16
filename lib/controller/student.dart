import 'package:http/http.dart' as http;
import 'package:ilias/model/student_m.dart';
import 'dart:convert';

class RemoteService {
  // GET DATA
  var client = http.Client();
  final _base_url = 'https://62f8b1193eab3503d1d9ba8c.mockapi.io/api/v1';

  Future getStudent() async {
    var response = await client.get(Uri.parse(_base_url + '/students'));
    if (response.statusCode == 200) {
      var json = response.body;
      return studentFromJson(json);
    }
  }

// ADD DATA
  Future postStundent(
      String student_name, String student_age, String student_id) async {
    try {
      var data = {
        "student_name": student_name,
        "student_age": student_age,
        "student_id": student_id,
        "status": '1'
      };
      var response =
          await client.post(Uri.parse(_base_url + '/students'), body: data);

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

// GET DATA by ID
  Future getStudentbyID(String id) async {
    try {
      var response =
          await client.get(Uri.parse(_base_url + '/students/' + id.toString()));
      // print(response.body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }

// UPDATE Students
  Future putStundent(String id, String student_name, String student_age,
      String student_id) async {
    try {
      var response = await client
          .put(Uri.parse(_base_url + '/students/' + id.toString()), body: {
        "student_name": student_name,
        "student_age": student_age,
        "student_id": student_id,
      });
      // print(response);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // DELETE DATA by ID
  Future deleteStudentbyID(String id) async {
    try {
      var response = await client
          .delete(Uri.parse(_base_url + '/students/' + id.toString()));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
