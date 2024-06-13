import 'package:flutter/material.dart';

import 'package:quotes_app/models/quote.dart';
import 'package:quotes_app/services/quote_api.dart';
import 'package:quotes_app/widgets/quote_card_item.dart';

class QuoteListScreen extends StatefulWidget {
  const QuoteListScreen({ super.key });

  @override
  State<QuoteListScreen> createState() => _QuoteListScreenState();
}

class _QuoteListScreenState extends State<QuoteListScreen> {
  late Future<List<Quote>> futureQuotes;
  List<Quote> allQuotes = [];

  @override
  void initState() {
    super.initState();
    futureQuotes = QuoteApi().getQuotes();
    futureQuotes.then((value) {
      setState(() {
        allQuotes = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Removes back arrow
          title: const Text("Quotes Library", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: FutureBuilder<List<Quote>>(
                    future: futureQuotes,
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(child: Text("Failed to load Quotes, Please try again"));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No quotes available'));
                      }  else {
                        return ListView.builder(
                            itemCount: allQuotes.length,
                            itemBuilder: (context, index) {
                              return QuoteCardItem(quote: allQuotes[index]);
                            }
                        );
                      }
                    }
                )
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)  ,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                  child: const Text("Back to Home", style: TextStyle(color: Colors.white),)
              ),
            )
          ],
        )
    );
  }
}