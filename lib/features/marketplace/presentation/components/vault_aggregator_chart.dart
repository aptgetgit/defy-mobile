import 'dart:math';

import 'package:defy/config/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class VaultAggregatorChart extends StatefulWidget {
  const VaultAggregatorChart({super.key});

  @override
  State<VaultAggregatorChart> createState() => _VaultAggregatorChartState();
}

class _VaultAggregatorChartState extends State<VaultAggregatorChart> {
  final List<FlSpot> spots = const <FlSpot>[
    FlSpot(1, 1.2),
    FlSpot(3, 1.5),
    FlSpot(5, 1.4),
    FlSpot(7, 2),
    FlSpot(10, 2),
    FlSpot(12, 2.4),
    FlSpot(13, 1.8),
  ];

  final List<FlSpot> spots3 = const <FlSpot>[
    FlSpot(1, 1.1),
    FlSpot(3, 1.2),
    FlSpot(5, 1),
    FlSpot(7, 2.2),
    FlSpot(10, 1.7),
    FlSpot(12, 2.2),
    FlSpot(13, 1.5),
  ];

  final List<FlSpot> spots2 = List.generate(101, (int i) => (i - 50) / 10)
      .map((double x) => FlSpot(x, cos(x)))
      .toList();

  // List.generate(101, (i) => (i - 50) / 10)
  //     .map((x) => FlSpot(x, cos(x)))
  //     .toList();

  Widget bottomTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    if (value % 1 != 0) {
      return Container();
    }
    final TextStyle style = TextStyle(
      color: AppColors.blue,
      fontWeight: FontWeight.bold,
      fontSize: min(18, 18 * chartWidth / 300),
    );
    return SideTitleWidget(
      space: 16,
      child: Text(meta.formattedValue, style: style),
      meta: meta,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    final TextStyle style = TextStyle(
      color: AppColors.red,
      fontWeight: FontWeight.bold,
      fontSize: min(18, 18 * chartWidth / 300),
    );
    return SideTitleWidget(
      meta: meta,
      space: 16,
      child: Text(meta.formattedValue, style: style),
    );
  }

  String index = '1D';

  void changeChartTime(String index) {
    setState(() {
      index = index;
    });
  }

  final List<String> chartTimes = <String>['1H', '1D', '1W', '1M', '1Y'];

  @override
  Widget build(BuildContext context) => Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                bottom: 24,
                top: 20,
              ),
              child: AspectRatio(
                aspectRatio: 2,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) => LineChart(
                      index == '1D'
                          ? LineChartData(
                              lineTouchData: LineTouchData(
                                touchTooltipData: LineTouchTooltipData(
                                  maxContentWidth: 100,
                                  getTooltipColor: (LineBarSpot touchedSpot) =>
                                      Colors.white,
                                  getTooltipItems: (List<LineBarSpot> touchedSpots) => touchedSpots
                                        .map((LineBarSpot touchedSpot) {
                                      final TextStyle textStyle = TextStyle(
                                        color: touchedSpot
                                                .bar.gradient?.colors[0] ??
                                            touchedSpot.bar.color!,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      );
                                      return LineTooltipItem(
                                        '${touchedSpot.x}, ${touchedSpot.y.toStringAsFixed(2)}',
                                        textStyle,
                                      );
                                    }).toList(),
                                ),
                                getTouchLineEnd: (LineChartBarData data, int index) => 0,
                                getTouchLineStart: (LineChartBarData data, int index) => 0,
                              ),
                              lineBarsData: <LineChartBarData>[
                                LineChartBarData(
                                  color: Colors.black,
                                  spots: spots,
                                  isCurved: true,
                                  isStrokeCapRound: true,
                                  barWidth: 3,
                                  belowBarData: BarAreaData(
                                    
                                  ),
                                  dotData: const FlDotData(show: false),
                                ),
                              ],
                              minY: 1,
                              maxY: 2.5,
                              titlesData: FlTitlesData(
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    getTitlesWidget: (double value, TitleMeta meta) =>
                                        leftTitleWidgets(
                                            value, meta, constraints.maxWidth,),
                                    reservedSize: 56,
                                  ),
                                ),
                                rightTitles: const AxisTitles(
                                  
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    getTitlesWidget: (double value, TitleMeta meta) =>
                                        bottomTitleWidgets(
                                            value, meta, constraints.maxWidth,),
                                    reservedSize: 36,
                                    interval: 1,
                                  ),
                                ),
                                topTitles: const AxisTitles(
                                  
                                ),
                              ),
                              gridData: FlGridData(
                                horizontalInterval: 1.5,
                                verticalInterval: 5,
                                checkToShowHorizontalLine: (double value) => value.toInt() == 0,
                                getDrawingHorizontalLine: (_) => const FlLine(
                                  color: Colors.transparent,
                                  dashArray: <int>[8, 2],
                                  strokeWidth: 0.8,
                                ),
                                getDrawingVerticalLine: (_) => const FlLine(
                                  color: Colors.transparent,
                                  dashArray: <int>[8, 2],
                                  strokeWidth: 0.8,
                                ),
                                checkToShowVerticalLine: (double value) => value.toInt() == 0,
                              ),
                              borderData: FlBorderData(show: false),
                            )
                          : index == '1W'
                              ? LineChartData(
                                  lineTouchData: LineTouchData(
                                    touchCallback: (FlTouchEvent fiTouchEvent,
                                        LineTouchResponse? lineTouch,) async {
                                      HapticFeedback.lightImpact();
                                    },
                                    touchTooltipData: LineTouchTooltipData(
                                      maxContentWidth: 100,
                                      getTooltipColor: (LineBarSpot touchedSpot) =>
                                          Colors.white,
                                      getTooltipItems: (List<LineBarSpot> touchedSpots) => touchedSpots
                                            .map((LineBarSpot touchedSpot) {
                                          final TextStyle textStyle = TextStyle(
                                            color: touchedSpot
                                                    .bar.gradient?.colors[0] ??
                                                touchedSpot.bar.color!,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          );
                                          return LineTooltipItem(
                                            '${touchedSpot.x}, ${touchedSpot.y.toStringAsFixed(2)}',
                                            textStyle,
                                          );
                                        }).toList(),
                                    ),
                                    getTouchLineEnd: (LineChartBarData data, int index) => 0,
                                    getTouchLineStart: (LineChartBarData data, int index) => 0,
                                  ),
                                  lineBarsData: <LineChartBarData>[
                                    LineChartBarData(
                                      color: Colors.black,
                                      spots: spots2,
                                      isCurved: true,
                                      isStrokeCapRound: true,
                                      barWidth: 3,
                                      belowBarData: BarAreaData(
                                        
                                      ),
                                      dotData: const FlDotData(show: false),
                                    ),
                                  ],
                                  minY: -1,
                                  maxY: 1,
                                  titlesData: FlTitlesData(
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        getTitlesWidget: (double value, TitleMeta meta) =>
                                            leftTitleWidgets(value, meta,
                                                constraints.maxWidth,),
                                        reservedSize: 56,
                                      ),
                                    ),
                                    rightTitles: const AxisTitles(
                                      
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        getTitlesWidget: (double value, TitleMeta meta) =>
                                            bottomTitleWidgets(value, meta,
                                                constraints.maxWidth,),
                                        reservedSize: 36,
                                        interval: 1,
                                      ),
                                    ),
                                    topTitles: const AxisTitles(
                                      
                                    ),
                                  ),
                                  gridData: FlGridData(
                                    horizontalInterval: 1.5,
                                    verticalInterval: 5,
                                    checkToShowHorizontalLine: (double value) => value.toInt() == 0,
                                    getDrawingHorizontalLine: (_) =>
                                        const FlLine(
                                      color: Colors.transparent,
                                      dashArray: <int>[8, 2],
                                      strokeWidth: 0.8,
                                    ),
                                    getDrawingVerticalLine: (_) => const FlLine(
                                      color: Colors.transparent,
                                      dashArray: <int>[8, 2],
                                      strokeWidth: 0.8,
                                    ),
                                    checkToShowVerticalLine: (double value) => value.toInt() == 0,
                                  ),
                                  borderData: FlBorderData(show: false),
                                )
                              : LineChartData(
                                  lineTouchData: LineTouchData(
                                    touchTooltipData: LineTouchTooltipData(
                                      maxContentWidth: 100,
                                      getTooltipColor: (LineBarSpot touchedSpot) =>
                                          Colors.white,
                                      getTooltipItems: (List<LineBarSpot> touchedSpots) => touchedSpots
                                            .map((LineBarSpot touchedSpot) {
                                          final TextStyle textStyle = TextStyle(
                                            color: touchedSpot
                                                    .bar.gradient?.colors[0] ??
                                                touchedSpot.bar.color!,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          );
                                          return LineTooltipItem(
                                            '${touchedSpot.x}, ${touchedSpot.y.toStringAsFixed(2)}',
                                            textStyle,
                                          );
                                        }).toList(),
                                    ),
                                    getTouchLineEnd: (LineChartBarData data, int index) => 0,
                                    getTouchLineStart: (LineChartBarData data, int index) => 0,
                                  ),
                                  lineBarsData: <LineChartBarData>[
                                    LineChartBarData(
                                      color: Colors.black,
                                      spots: spots3,
                                      isCurved: true,
                                      isStrokeCapRound: true,
                                      barWidth: 3,
                                      belowBarData: BarAreaData(
                                        
                                      ),
                                      dotData: const FlDotData(show: false),
                                    ),
                                  ],
                                  minY: 1,
                                  maxY: 2.5,
                                  titlesData: FlTitlesData(
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        getTitlesWidget: (double value, TitleMeta meta) =>
                                            leftTitleWidgets(value, meta,
                                                constraints.maxWidth,),
                                        reservedSize: 56,
                                      ),
                                    ),
                                    rightTitles: const AxisTitles(
                                      
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        getTitlesWidget: (double value, TitleMeta meta) =>
                                            bottomTitleWidgets(value, meta,
                                                constraints.maxWidth,),
                                        reservedSize: 36,
                                        interval: 1,
                                      ),
                                    ),
                                    topTitles: const AxisTitles(
                                      
                                    ),
                                  ),
                                  gridData: FlGridData(
                                    horizontalInterval: 1.5,
                                    verticalInterval: 5,
                                    checkToShowHorizontalLine: (double value) => value.toInt() == 0,
                                    getDrawingHorizontalLine: (_) =>
                                        const FlLine(
                                      color: Colors.transparent,
                                      dashArray: <int>[8, 2],
                                      strokeWidth: 0.8,
                                    ),
                                    getDrawingVerticalLine: (_) => const FlLine(
                                      color: Colors.transparent,
                                      dashArray: <int>[8, 2],
                                      strokeWidth: 0.8,
                                    ),
                                    checkToShowVerticalLine: (double value) => value.toInt() == 0,
                                  ),
                                  borderData: FlBorderData(show: false),
                                ),
                      duration: const Duration(milliseconds: 250),
                    ),
                ),
              ),
            ),
            const Positioned(
                right: 20,
                bottom: 0,
                child: Text(
                  r'$1,201.23',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyDark,),
                ),),
          ],
        ),
        const Gap(32),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(chartTimes.length, (int index) {
              final String item = chartTimes[index];
              return GestureDetector(
                onTap: () {
                  changeChartTime(item);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: index == item ? AppColors.greyVeryLight : AppColors.transparent,
                        borderRadius: BorderRadius.circular(40),),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Center(
                        child: Text(
                          item,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: index == item ? Colors.black : AppColors.greyLight,),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),),
      ],
    );
}
