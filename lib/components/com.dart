import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Valutes>> fetchValutes(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://www.cbr-xml-daily.ru/daily_json.js'));

  if (response.statusCode == 200) {
    return compute(parseValutes, response.body);
  } else {
    throw Exception('Failed to load CoinsList');
  }
}

List<Valutes> parseValutes(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Valutes>((json) => Valutes.fromJson(json)).toList();
}

class Valutes {
  final String ID;
  final String NumCode;
  final String CharCode;
  final int Nominal;
  final String Name;
  final double Value;
  final double Previous;

  const Valutes({
    required this.ID,
    required this.NumCode,
    required this.CharCode,
    required this.Nominal,
    required this.Name,
    required this.Value,
    required this.Previous,
  });

  factory Valutes.fromJson(Map<String, dynamic> json) {
    return Valutes(
      ID: json['Valute']['AUD']['ID'] as String,
      NumCode: json['Valute']['AUD']['NumCode'] as String,
      CharCode: json['Valute']['AUD']['CharCode'] as String,
      Nominal: json['Valute']['AUD']['Nominal'] as int,
      Name: json['Valute']['AUD']['Name'] as String,
      Value: json['Valute']['AUD']['Value'] as double,
      Previous: json['Valute']['AUD']['Previous'] as double,
    );
  }
}
