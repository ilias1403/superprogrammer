import 'package:flutter/material.dart';
import 'package:ilias/view/notification_v.dart';
import 'package:ilias/view/login/login_v.dart';
import 'package:ilias/controller/quote.dart';
import 'package:ilias/model/quote_m.dart';
import 'package:ilias/view/login/login_v.dart';
import 'package:ilias/view/quote/add_quote_v.dart';
import 'package:ilias/view/quote/edit_quote_v.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuoteController quote = QuoteController();
  List<Quote>? quotes;
  var isLoaded = false;
  // var tokens;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    quotes = await QuoteController().getQuoteList();
    // String? token = await FirebaseMessaging.instance.getToken();

    if (quotes != null) {
      setState(() {
        isLoaded = true;
        // tokens = token;
      });
    }
    // print("Log : $token");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The title text which will be shown on the action bar
          title: const Text('Home Page'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              // onPressed: () => Navigator.of(context).popAndPushNamed('/add'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddQuote()),
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
                icon: const Icon(Icons.logout_rounded),
                // onPressed: () => Navigator.of(context).popAndPushNamed('/add'),
                onPressed: logout)
          ],
        ),
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
              itemCount: quotes?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditQuote(
                                id: quotes![index].quoteId,
                                quote: quotes![index].quote,
                                author: quotes![index].author,
                              )),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 30.0,
                        // backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                      title: Text(quotes![index].quote),
                      subtitle: Text(quotes![index].author),
                      trailing: IconButton(
                          onPressed: () async {
                            bool response =
                                await quote.deleteQuote(quotes![index].quoteId);
                            if (response) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
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

  void logout() async {
    // logout from the server ...

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('token');
    print('logout');
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const MyLogin()),
      (_) => false,
    );
  }
}
