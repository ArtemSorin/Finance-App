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

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List items = [
      Container(
        height: height * 0.25,
        width: width,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 91, 117, 240),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
            margin: const EdgeInsets.only(top: 90, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    '●●●● ●●●● ●●●● 6653',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    '09/23',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Artem Sorin',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ],
            )),
      ),
      Container(
        height: height * 0.25,
        width: width,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 91, 117, 240),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
            margin: const EdgeInsets.only(top: 90, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    '●●●● ●●●● ●●●● 4356',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    '06/26',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Artem Sorin',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ],
            )),
      ),
    ];

    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          actions: [
            IconButton(
                onPressed: () => {},
                icon: const Icon(
                  Icons.add_circle,
                  color: Color.fromARGB(255, 91, 117, 240),
                ))
          ],
          backgroundColor: const Color.fromARGB(255, 91, 117, 240),
          title: const Text(
            'Valutes App',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: FutureBuilder<CoinsList>(
            future: futureCoinsList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: <Widget>[
                    SizedBox(
                      height: height * 0.35,
                      child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: PageView.builder(
                              itemCount: 2,
                              pageSnapping: true,
                              itemBuilder: (context, pagePosition) {
                                return Container(
                                    height: height * 0.35,
                                    margin: const EdgeInsets.all(10),
                                    child: items[pagePosition]);
                              })),
                    ),
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
