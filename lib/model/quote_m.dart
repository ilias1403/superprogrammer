// To parse this JSON data, do
//
//     final quote = quoteFromJson(jsonString);

import 'dart:convert';

List<Quote> quoteFromJson(String str) =>
    List<Quote>.from(json.decode(str).map((x) => Quote.fromJson(x)));

String quoteToJson(List<Quote> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quote {
  Quote({
    required this.quoteId,
    required this.quote,
    required this.author,
    required this.image,
    required this.status,
    required this.dtAdded,
    required this.dtUpdated,
  });

  String quoteId;
  String quote;
  String author;
  dynamic image;
  String status;
  DateTime dtAdded;
  DateTime dtUpdated;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        quoteId: json["quote_id"],
        quote: json["quote"],
        author: json["author"],
        image: json["image"],
        status: json["status"],
        dtAdded: DateTime.parse(json["dt_added"]),
        dtUpdated: DateTime.parse(json["dt_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "quote_id": quoteId,
        "quote": quote,
        "author": author,
        "image": image,
        "status": status,
        "dt_added": dtAdded.toIso8601String(),
        "dt_updated": dtUpdated.toIso8601String(),
      };
}
