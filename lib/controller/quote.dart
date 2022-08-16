import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ilias/model/quote_m.dart';
import 'package:ilias/helper/general_helper.dart' as globals;

class QuoteController {
  // GET DATA
  var client = http.Client();

  Future getQuoteList() async {
    var response = await client
        .get(Uri.parse(globals.Api_base_url + '/super/fetch_data_quotes'));
    if (response.statusCode == 200) {
      var jsons = response.body;
      return quoteFromJson(jsons);
    }
  }

  Future addQuotes(data) async {
    var response = await client
        .post(Uri.parse(globals.Api_base_url + '/super/add_quote'), body: data);
    var jsons = json.decode(response.body);
    if (response.statusCode == 200 && jsons['status'] == 'success') {
      return true;
    } else {
      return false;
    }
  }

  Future editQuotes(data) async {
    var response = await client.post(
        Uri.parse(globals.Api_base_url + '/super/edit_quote'),
        body: data);
    var jsons = json.decode(response.body);
    if (response.statusCode == 200 && jsons['status'] == 'success') {
      return true;
    } else {
      return false;
    }
  }

  Future deleteQuote(id) async {
    var data = {
      "quote_id": id,
    };
    var response = await client.post(
        Uri.parse(globals.Api_base_url + '/super/delete_quote'),
        body: data);
    var jsons = json.decode(response.body);
    if (response.statusCode == 200 && jsons['status'] == 'success') {
      return true;
    } else {
      return false;
    }
  }
}
