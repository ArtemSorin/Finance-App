import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Valute> fetchCoinsList() async {
  final response =
      await http.get(Uri.parse('https://www.cbr-xml-daily.ru/latest.js'));

  if (response.statusCode == 200) {
    return Valute.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load CoinsList');
  }
}

class Valute {
  Valute({
    required this.disclaimer,
    required this.date,
    required this.timestamp,
    required this.base,
    required this.rates,
  });

  String disclaimer;
  DateTime date;
  int timestamp;
  String base;
  Map<String, double> rates;

  factory Valute.fromJson(Map<String, dynamic> json) => Valute(
        disclaimer: json["disclaimer"],
        date: DateTime.parse(json["date"]),
        timestamp: json["timestamp"],
        base: json["base"],
        rates: Map.from(json["rates"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "disclaimer": disclaimer,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "timestamp": timestamp,
        "base": base,
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
