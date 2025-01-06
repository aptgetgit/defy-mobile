import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LiveStockChart extends StatefulWidget {
  const LiveStockChart({Key? key}) : super(key: key);

  @override
  LiveStockChartState createState() => LiveStockChartState();
}

class LiveStockChartState extends State<LiveStockChart> {
  final List<ChartData> chartData = [];
  double lastPrice = 30;
  Timer? timer;
  final int maxDataPoints = 60;
  final double threshold = 34;

  @override
  void initState() {
    super.initState();
    _initializeData();
    startDataSimulation();
  }

  void _initializeData() {
    final random = Random();
    for (int i = 0; i < maxDataPoints; i++) {
      chartData.add(ChartData(i.toDouble(), 32 + random.nextDouble() * 4));
    }
    lastPrice = chartData.last.y;
  }

  void startDataSimulation() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        double change = (Random().nextDouble() - 0.5) * 0.5;
        lastPrice = max(32, min(36, lastPrice + change));
        if (chartData.length >= maxDataPoints) {
          chartData.removeAt(0);
          for (int i = 0; i < chartData.length; i++) {
            chartData[i] = ChartData(i.toDouble(), chartData[i].y);
          }
        }
        chartData.add(ChartData(chartData.length.toDouble(), lastPrice));
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      margin: EdgeInsets.all(0),
      primaryXAxis: NumericAxis(
        isVisible: false,
        minimum: 0,
        maximum: maxDataPoints.toDouble() - 1,
      ),
      primaryYAxis: NumericAxis(
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        minimum: 32,
        maximum: 36,
        interval: 1,
        labelStyle: TextStyle(color: Colors.grey[600], fontSize: 12),
      ),
      series: <CartesianSeries>[
        LineSeries<ChartData, double>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          width: 2,
          pointColorMapper: (ChartData data, _) =>
              data.y >= threshold ? Color(0xff089981) : Color(0xffF23645),
        )
      ],
      plotAreaBackgroundColor: Colors.transparent,
      borderColor: Colors.transparent,
      enableAxisAnimation: true,
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final double y;
}
