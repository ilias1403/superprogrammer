import 'package:flutter/material.dart';
import 'package:ilias/controller/quote.dart';
import 'package:ilias/view/home_page.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EditQuote extends StatefulWidget {
  final String id;
  // final String quote;
  // final String author;

  const EditQuote({
    Key? key,
    required this.id,
    // required this.quote,
    // required this.author,
  }) : super(key: key);

  @override
  _EditQuoteState createState() => _EditQuoteState();
}

class _EditQuoteState extends State<EditQuote> {
  QuoteController quote = QuoteController();

  var _id = TextEditingController();
  var _quote = TextEditingController();
  var _author = TextEditingController();
  String? images;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
    // _id.text = widget.id;
    // // _quote.text = widget.quote;
    // // _author.text = widget.author;
  }

  getData() async {
    var quote = await QuoteController().getQuoteById(widget.id);
    if (quote != null) {
      setState(() {
        isLoaded = true;
        _id.text = widget.id;
        _quote.text = quote['quote'];
        _author.text = quote['author'];
        images = quote['image'];
      });
    }
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
          // const Center(child: CircularProgressIndicator()),
          Center(
            child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage, image: images!),
          ),
          TextField(
              controller: _quote,
              maxLines: 8,
              decoration: InputDecoration(hintText: 'Student Name')),
          TextField(
              controller: _author,
              decoration: InputDecoration(hintText: 'Student Age')),
          ElevatedButton(
              onPressed: () async {
                var data = {
                  "quote_id": _id.text,
                  "quote": _quote.text,
                  "author": _author.text,
                };
                bool response = await quote.editQuotes(data);
                if (response) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
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
