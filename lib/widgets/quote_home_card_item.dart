import 'package:flutter/material.dart';

import '../models/quote.dart';

class QuoteHomeCardItem extends StatelessWidget {
  final Quote quote;

  const QuoteHomeCardItem({ super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 350,
      padding: const EdgeInsets.all(25),
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
      child: Center(
        child: Text(
          quote.quote,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }


}