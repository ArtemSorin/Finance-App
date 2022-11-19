import 'dart:async';

import 'package:finance_app/components/component.dart';
import 'package:flutter/material.dart';

class Valutes extends StatefulWidget {
  const Valutes({super.key});

  @override
  State<Valutes> createState() => _MyAppState();
}

class _MyAppState extends State<Valutes> {
  late Future<CoinsList> futureCoinsList;
  final ct = 3;
  final symbol = '₽';

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
          backgroundColor: Colors.white,
          title: const Text(
            'Valutes App',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: FutureBuilder<CoinsList>(
            future: futureCoinsList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: <Widget>[
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 91, 117, 240),
                        child: Text('¥'),
                      ),
                      title: const Text(
                        'JPY',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Japanese yen'),
                      trailing: Text(symbol +
                          (1 / snapshot.data!.title['AUD'])
                              .toStringAsFixed(ct)),
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 91, 117, 240),
                        child: Text('₼'),
                      ),
                      title: const Text(
                        'AZN',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Azerbaijani manat'),
                      trailing: Text(symbol +
                          (1 / snapshot.data!.title['AZN'])
                              .toStringAsFixed(ct)),
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 91, 117, 240),
                        child: Text('￡'),
                      ),
                      title: const Text(
                        'GPB',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Pound sterling'),
                      trailing: Text(symbol +
                          (1 / snapshot.data!.title['GBP'])
                              .toStringAsFixed(ct)),
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 91, 117, 240),
                        child: Text('€'),
                      ),
                      title: const Text(
                        'EUR',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Euro'),
                      trailing: Text(symbol +
                          (1 / snapshot.data!.title['EUR'])
                              .toStringAsFixed(ct)),
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 91, 117, 240),
                        child: Text('₣'),
                      ),
                      title: const Text(
                        'CHF',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Swiss franc'),
                      trailing: Text(symbol +
                          (1 / snapshot.data!.title['CHF'])
                              .toStringAsFixed(ct)),
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
