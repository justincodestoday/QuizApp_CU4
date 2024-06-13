import 'package:flutter/material.dart';

import '../models/quote.dart';

class QuoteCardItem extends StatelessWidget {
  final Quote quote;

  const QuoteCardItem({ super.key, required this.quote });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            quote.quote,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                quote.author,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic
                ),
              )
            ]
          )
          // Text(
          //   quote.author,
          //   style: const TextStyle(
          //     fontSize: 12,
          //     fontWeight: FontWeight.normal,
          //     fontStyle: FontStyle.italic,
          //   ),
          //   textAlign: TextAlign.end,
          // )
        ],
      ),
    );
  }
}