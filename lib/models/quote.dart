class Quote {
  final int id;
  final String quote;
  final String author;

  Quote({
    required this.id,
    required this.quote,
    required this.author
  });

  factory Quote.fromJson(Map<String, dynamic> map) {
    return Quote(
      id: map['id'],
      quote: map['quote'],
      author: map['author']
    );
  }
}

