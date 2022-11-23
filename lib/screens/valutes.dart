import 'dart:async';

import 'package:finance_app/components/com.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  final ct = 3;
  final symbol = '₽';

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
                  color: Colors.white,
                ))
          ],
          backgroundColor: const Color.fromARGB(255, 91, 117, 240),
          title: const Text(
            'Finance App',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: FutureBuilder<List<Valutes>>(
            future: fetchValutes(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 91, 117, 240),
                        child: Text('O'),
                      ),
                      title: Text(snapshot.data![index].CharCode),
                      subtitle: Text(snapshot.data![index].Name),
                      onTap: () => {},
                      trailing:
                          Text(snapshot.data![index].Value.toStringAsFixed(3)),
                    );
                  },
                  itemCount: snapshot.data!.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
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
