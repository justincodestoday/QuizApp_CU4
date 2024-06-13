import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:quotes_app/models/quote.dart';

class QuoteApi {
  final String baseUrl = 'https://fcapi-1y70.onrender.com/quotes';

  Future<List<Quote>> getQuotes() async {
    final response = await http.get(Uri.parse(baseUrl));

    if(response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Quote.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load quotes');
    }
  }
}