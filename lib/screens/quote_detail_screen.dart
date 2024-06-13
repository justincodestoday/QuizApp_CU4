import 'package:flutter/material.dart';

import 'package:quotes_app/models/quote.dart';

class QuoteDetailScreen extends StatelessWidget {
  final Quote quote;

  const QuoteDetailScreen({ super.key, required this.quote });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //Remove the back arrow button
          title: Text("Quote No. ${quote.id}", style: const TextStyle(color: Colors.white),),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            quote.quote,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                quote.author,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                    child: const Text("Back to Home", style: TextStyle(color: Colors.white),)
                )
              ],
            )
        )
    );
  }
}