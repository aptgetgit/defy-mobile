import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

class StakingChart extends StatefulWidget {
  const StakingChart({super.key});

  @override
  State<StakingChart> createState() => _StakingChartState();
}

class _StakingChartState extends State<StakingChart> {
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

  List<FlSpot> touchedSpots = <FlSpot>[];
  FlSpot? lastTouchedSpot;

  Widget bottomTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    if (value % 1 != 0) {
      return Container();
    }
    final TextStyle style = TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontSize: min(18, 18 * chartWidth / 300),
    );
    return SideTitleWidget(
      fitInside: SideTitleFitInsideData.fromTitleMeta(meta),
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
      fitInside: SideTitleFitInsideData.fromTitleMeta(meta),
      space: 16,
      child: Text(meta.formattedValue, style: style),
      meta: meta,
    );
  }

  String index = "1M";

  void changeChartTime(String _index) {
    setState(() {
      index = _index;
      lastTouchedSpot = null; // Reset the touched spot when changing the chart time
    });
  }

  final List<String> chartTimes = <String>["1M", "3M", "6M", "1Y", "5Y", "ALL"];

  @override
  Widget build(BuildContext context) => Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 0,
                bottom: 24,
                right: 0,
                top: 20,
              ),
              child: AspectRatio(
                aspectRatio: 2,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) => LineChart(
                    LineChartData(
                      lineTouchData: LineTouchData(
                        touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {
                          if (event is FlTapDownEvent) {
                            setState(() {
                              if (touchResponse == null || touchResponse.lineBarSpots == null) {
                                touchedSpots = <FlSpot>[];
                                lastTouchedSpot = null;
                                return;
                              }
                              touchedSpots = touchResponse.lineBarSpots!.map((TouchLineBarSpot e) => FlSpot(e.x, e.y)).toList();
                              lastTouchedSpot = touchedSpots.last;
                            });
                          } else if (event is FlTapUpEvent) {
                            setState(() {
                              lastTouchedSpot = null;
                            });
                          }
                        },
                        touchTooltipData: LineTouchTooltipData(
                          maxContentWidth: 100,
                          getTooltipColor: (LineBarSpot touchedSpot) => Colors.white,
                          getTooltipItems: (List<LineBarSpot> touchedSpots) => touchedSpots
                              .map((LineBarSpot touchedSpot) {
                            final TextStyle textStyle = TextStyle(
                              color: touchedSpot.bar.gradient?.colors[0] ?? touchedSpot.bar.color!,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            );
                            return LineTooltipItem(
                              '${touchedSpot.x}, ${touchedSpot.y.toStringAsFixed(2)}',
                              textStyle,
                            );
                          }).toList(),
                        ),
                        handleBuiltInTouches: true,
                        getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) => spotIndexes.map((int spotIndex) => TouchedSpotIndicatorData(
                              const FlLine(
                                color: Colors.black,
                                strokeWidth: 1.5,
                              ),
                              FlDotData(
                                show: true,
                                getDotPainter: (FlSpot spot, double percent, LineChartBarData barData, int index) => FlDotCirclePainter(
                                    radius: 6,
                                    color: Colors.black,
                                    strokeWidth: 0,
                                    strokeColor: Colors.black,
                                  ),
                              ),
                            )).toList(),
                      ),
                      lineBarsData: <LineChartBarData>[
                        LineChartBarData(
                          color: Colors.black,
                          spots: index == "3M" ? spots : index == "6M" ? spots2 : spots3,
                          isCurved: true,
                          isStrokeCapRound: true,
                          barWidth: 3,
                          belowBarData: BarAreaData(
                            show: false,
                          ),
                          dotData: const FlDotData(show: false),
                        ),
                        if (lastTouchedSpot != null)
                          LineChartBarData(
                            color: Colors.grey,
                            spots: (index == "3M" ? spots : index == "6M" ? spots2 : spots3)
                                .where((FlSpot spot) => spot.x >= lastTouchedSpot!.x)
                                .toList(),
                            isCurved: true,
                            isStrokeCapRound: true,
                            barWidth: 3,
                            belowBarData: BarAreaData(
                              show: false,
                            ),
                            dotData: const FlDotData(show: false),
                          ),
                      ],
                      minY: index == "6M" ? -1 : 1,
                      maxY: index == "6M" ? 1 : 2.5,
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                            getTitlesWidget: (double value, TitleMeta meta) => leftTitleWidgets(value, meta, constraints.maxWidth),
                            reservedSize: 56,
                          ),
                          drawBelowEverything: true,
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                            getTitlesWidget: (double value, TitleMeta meta) => bottomTitleWidgets(value, meta, constraints.maxWidth),
                            reservedSize: 36,
                            interval: 1,
                          ),
                          drawBelowEverything: true,
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      gridData: FlGridData(
                        show: true,
                        drawHorizontalLine: true,
                        drawVerticalLine: true,
                        horizontalInterval: 1.5,
                        verticalInterval: 5,
                        checkToShowHorizontalLine: (double value) => value.toInt() == 0,
                        getDrawingHorizontalLine: (_) => const FlLine(
                          color: Colors.transparent,
                          strokeWidth: 0.8,
                        ),
                        getDrawingVerticalLine: (double value) {
                          if (touchedSpots.any((FlSpot spot) => spot.x == value)) {
                            return const FlLine(
                              color: Colors.black,
                              strokeWidth: 1.5,
                            );
                          }
                          return const FlLine(
                            color: Colors.transparent,
                            strokeWidth: 0.8,
                          );
                        },
                        checkToShowVerticalLine: (double value) => true,
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
                  "\$1,201.23",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ))
          ],
        ),
        const Gap(32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(chartTimes.length, (int _index) {
                  final String item = chartTimes[_index];
                  return GestureDetector(
                    onTap: () {
                      changeChartTime(item);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Container(
                        height: 26,
                        width: 44,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: index == item ? AppColors.black : AppColors.transparent,),
                          color: index == item ? AppColors.greyVeryLight : AppColors.transparent,
                          borderRadius: BorderRadius.circular(40)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          child: Center(
                            child: Text(
                              item,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: index == item ? AppColors.black : AppColors.greyLight),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })),
            IconButton(
              onPressed: () {},
              icon: const Icon(PhosphorIconsFill.sliders, color: AppColors.greyLight, size: 20,),
            )
          ],
        )
      ],
    );
}