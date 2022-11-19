import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charts in Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Finance Diagram'),
          backgroundColor: const Color.fromARGB(255, 91, 117, 240),
        ),
        body: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: 'Your expenses for the current period'),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<_Infections, String>>[
              LineSeries<_Infections, String>(
                  color: const Color.fromARGB(255, 91, 117, 240),
                  dataSource: <_Infections>[
                    _Infections('Jan', 3500),
                    _Infections('Feb', 2800),
                    _Infections('Mar', 3400),
                    _Infections('Apr', 3200),
                    _Infections('May', 4000),
                    _Infections('Jun', 6000)
                  ],
                  xValueMapper: (_Infections victims, _) => victims.year,
                  yValueMapper: (_Infections victims, _) => victims.victims,
                  // Enable data label
                  dataLabelSettings: const DataLabelSettings(isVisible: true))
            ]));
  }
}

class _Infections {
  _Infections(this.year, this.victims);

  final String year;
  final double victims;
}
