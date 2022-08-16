import 'package:http/http.dart' as http;
import 'package:ilias/model/user_m.dart';
import 'dart:convert';

class RemoteService {
  // GET DATA
  var client = http.Client();
  final _base_url = 'https://62f8b1193eab3503d1d9ba8c.mockapi.io/api/v1';

// GET DATA by ID
  Future getUsersById(dynamic userData) async {
    try {
      var data = userData;
      var response =
          await client.post(Uri.parse(_base_url + '/users/'), body: data);
      // print(response.body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }

// UPDATE users
  Future updateTokenUser(String id, String token) async {
    try {
      var data = {"token": token};
      var response = await client
          .put(Uri.parse(_base_url + '/users/' + id.toString()), body: data);
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
}
