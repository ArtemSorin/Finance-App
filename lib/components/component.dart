import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<CoinsList> fetchCoinsList(http.Client client) async {
  final response =
      await http.get(Uri.parse('https://www.cbr-xml-daily.ru/latest.js'));

  if (response.statusCode == 200) {
    return CoinsList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load CoinsList');
  }
}

class CoinsList {
  final Map<String, dynamic> title;

  const CoinsList({
    required this.title,
  });

  factory CoinsList.fromJson(Map<String, dynamic> json) {
    return CoinsList(
      title: json['rates'],
    );
  }
}
