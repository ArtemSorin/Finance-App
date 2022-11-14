import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<CoinsList> fetchCoinsList() async {
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

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<CoinsList> futureCoinsList;
  final ct = 3;

  @override
  void initState() {
    super.initState();
    futureCoinsList = fetchCoinsList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<CoinsList>(
            future: futureCoinsList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: <Widget>[
                    ListTile(
                      title:
                          Text(snapshot.data!.title['AUD'].toStringAsFixed(ct)),
                    ),
                    ListTile(
                      title:
                          Text(snapshot.data!.title['AZN'].toStringAsFixed(ct)),
                    ),
                    ListTile(
                      title:
                          Text(snapshot.data!.title['GBP'].toStringAsFixed(ct)),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
