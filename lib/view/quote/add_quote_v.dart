import 'package:flutter/material.dart';
import 'package:ilias/controller/quote.dart';

import '../home_page.dart';

class AddQuote extends StatefulWidget {
  const AddQuote({Key? key}) : super(key: key);

  @override
  _AddQuoteState createState() => _AddQuoteState();
}

class _AddQuoteState extends State<AddQuote> {
  QuoteController quote = QuoteController();

  final _quote = TextEditingController();
  final _author = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Quote'),
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
              controller: _quote,
              maxLines: 8,
              decoration: InputDecoration(hintText: 'Quote')),
          TextField(
              controller: _author,
              decoration: InputDecoration(hintText: 'Author')),
          ElevatedButton(
              onPressed: () async {
                var data = {
                  "quote": _quote.text,
                  "author": _author.text,
                };
                bool response = await quote.addQuotes(data);
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
