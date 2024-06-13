// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:quiz_id_flutter/api/quotes_api.dart';
// import 'package:quiz_id_flutter/model/quotes_model.dart';
// import 'package:quiz_id_flutter/screens/individual.dart';
// import 'package:quiz_id_flutter/screens/show_all.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({ super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final QuotesApi quotesApi = QuotesApi();
//   late Future<List<Quotes>> futureQuotes;
//   Quotes? randomQuotes;

//   @override
//   void initState() {
//     super.initState();
//     fetchQuotes;
//   }

//   void fetchQuotes() {
//     futureQuotes = quotesApi.getQuotes();
//     futureQuotes.then((quotes) {
//       setState(() {
//         randomQuotes = (quotes..shuffle()).first;
//       });
//     }).catchError((error) {
//       print("Failed to loadQuotes: " + error);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: const Text("Quotes", style: TextStyle(color: Colors.white),),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if( randomQuotes != null)
//             Container(
//               width: 350,
//               height: 350,
//               padding: const EdgeInsets.all(25),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey, width: 2.0),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context, 
//                     MaterialPageRoute(builder: (context) => Individual(quotes: randomQuotes!))
//                   );
//                 },
//                 child: Center(
//                   child: Text(
//                     randomQuotes!.quote,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                 )

//               )
//             ),
//             const SizedBox(height: 45),
//             Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Add your onPressed code here!
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red
//                     ),
//                     child: const Text('Refresh', style: TextStyle(color: Colors.white),),

//                   ),
//                   const SizedBox(height: 15),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context, 
//                         MaterialPageRoute(builder: (context) => const ShowAll())
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red
//                     ),
//                     child: const Text('Show All', style: TextStyle(color: Colors.white),),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         )
//       );
//     }
//   }

import 'package:flutter/material.dart';
import 'package:quotes_app/models/quote.dart';
import 'package:quotes_app/screens/quote_detail_screen.dart';
import 'package:quotes_app/screens/quote_list_screen.dart';
import 'package:quotes_app/services/quote_api.dart';
import 'package:quotes_app/widgets/quote_home_card_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final QuoteApi quoteApi = QuoteApi();
  Quote? currentQuote;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchInitialQuote();
  }

  void fetchInitialQuote() async {
    try {
      List<Quote> quotes = await quoteApi.getQuotes();
      setState(() {
        currentQuote = quotes.first;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Failed to fetch quotes: $error');
    }
  }

  void fetchNewQuote() async {
    setState(() {
      isLoading = true;
    });
    try {
      List<Quote> quotes = await quoteApi.getQuotes();
      setState(() {
        currentQuote = (quotes..shuffle()).first;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Failed to fetch quotes: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Quote of the Day",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // InkWell(
            //   onTap: () {
            //     if(!isLoading && currentQuote != null) {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => QuoteDetailScreen(quote: currentQuote!)
            //         )
            //       );
            //     }
            //   },
            //   child: QuoteHomeCardItem(quote: currentQuote!, isLoading: false),
            // ),
            Container( // Quote card design at Home Screen (FIX IT)
              width: 350,
              height: 350,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.white, width: 2.0),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 10.0,
                    spreadRadius: 2.0
                  )
                ]
              ),
              child: InkWell(
                onTap: () {
                  if (!isLoading && currentQuote != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuoteDetailScreen(quote: currentQuote!),
                      ),
                    );
                  }
                },
                child: Center(
                  child: isLoading
                      ? const CircularProgressIndicator(
                    color: Colors.deepPurple,
                  )
                      : Text(
                    currentQuote!.quote,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: fetchNewQuote,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(horizontal: 40.0)
                  ),
                  child: const Text(
                    'Refresh',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QuoteListScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(horizontal: 40.0)
                  ),
                  child: const Text(
                    'Show All',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
