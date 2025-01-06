import 'dart:math';

import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class LeverageTradingChart extends StatefulWidget {
  const LeverageTradingChart({super.key});

  @override
  State<LeverageTradingChart> createState() => _LeverageTradingChartState();
}

class _LeverageTradingChartState extends State<LeverageTradingChart> {
  final spots = const [
    FlSpot(1, 1.2),
    FlSpot(3, 1.5),
    FlSpot(5, 1.4),
    FlSpot(7, 2),
    FlSpot(10, 2),
    FlSpot(12, 2.4),
    FlSpot(13, 1.8),
  ];

  final spots3 = const [
    FlSpot(1, 1.1),
    FlSpot(3, 1.2),
    FlSpot(5, 1),
    FlSpot(7, 2.2),
    FlSpot(10, 1.7),
    FlSpot(12, 2.2),
    FlSpot(13, 1.5),
  ];

  final spots2 = List.generate(101, (i) => (i - 50) / 10)
      .map((x) => FlSpot(x, cos(x)))
      .toList();

  Widget bottomTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    if (value % 1 != 0) {
      return Container();
    }
    final style = TextStyle(
      color: AppColors.blue,
      fontWeight: FontWeight.bold,
      fontSize: min(18, 18 * chartWidth / 300),
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(meta.formattedValue, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    final style = TextStyle(
      color: AppColors.red,
      fontWeight: FontWeight.bold,
      fontSize: min(18, 18 * chartWidth / 300),
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(meta.formattedValue, style: style),
    );
  }

  String index = "1D";

  void changeChartTime(String _index) {
    setState(() {
      index = _index;
    });
  }

  final chartTimes = ["1H", "1D", "1W", "1M", "1Y"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 0,
                bottom: context.screenHeight * 0.03,
                right: 0,
                top: context.screenHeight * 0.035,
              ),
              child: AspectRatio(
                aspectRatio: 2,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return LineChart(
                      index == "1D"
                          ? LineChartData(
                              lineTouchData: LineTouchData(
                                touchTooltipData: LineTouchTooltipData(
                                  maxContentWidth: 100,
                                  getTooltipColor: (touchedSpot) =>
                                      AppColors.white,
                                  getTooltipItems: (touchedSpots) {
                                    return touchedSpots
                                        .map((LineBarSpot touchedSpot) {
                                      final textStyle =
                                          context.bodyMedium?.copyWith(
                                        color: touchedSpot
                                                .bar.gradient?.colors[0] ??
                                            touchedSpot.bar.color!,
                                        fontWeight: FontWeight.bold,
                                      );
                                      return LineTooltipItem(
                                        '${touchedSpot.x}, ${touchedSpot.y.toStringAsFixed(2)}',
                                        textStyle!,
                                      );
                                    }).toList();
                                  },
                                ),
                                handleBuiltInTouches: true,
                                getTouchLineEnd: (data, index) => 0,
                                getTouchLineStart: (data, index) => 0,
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  color: AppColors.black,
                                  spots: spots,
                                  isCurved: true,
                                  isStrokeCapRound: true,
                                  barWidth: 3,
                                  belowBarData: BarAreaData(show: false),
                                  dotData: const FlDotData(show: false),
                                ),
                              ],
                              minY: 1,
                              maxY: 2.5,
                              titlesData: FlTitlesData(
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                    getTitlesWidget: (value, meta) =>
                                        leftTitleWidgets(
                                            value, meta, constraints.maxWidth),
                                    reservedSize: 56,
                                  ),
                                  drawBelowEverything: true,
                                ),
                                rightTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                    getTitlesWidget: (value, meta) =>
                                        bottomTitleWidgets(
                                            value, meta, constraints.maxWidth),
                                    reservedSize: 36,
                                    interval: 1,
                                  ),
                                  drawBelowEverything: true,
                                ),
                                topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                              ),
                              gridData: FlGridData(
                                show: true,
                                drawHorizontalLine: true,
                                drawVerticalLine: true,
                                horizontalInterval: 1.5,
                                verticalInterval: 5,
                                checkToShowHorizontalLine: (value) =>
                                    value.toInt() == 0,
                                getDrawingHorizontalLine: (_) => FlLine(
                                  color: AppColors.transparent,
                                  dashArray: [8, 2],
                                  strokeWidth: 0.8,
                                ),
                                getDrawingVerticalLine: (_) => FlLine(
                                  color: AppColors.transparent,
                                  dashArray: [8, 2],
                                  strokeWidth: 0.8,
                                ),
                                checkToShowVerticalLine: (value) =>
                                    value.toInt() == 0,
                              ),
                              borderData: FlBorderData(show: false),
                            )
                          : index == "1W"
                              ? LineChartData(
                                  lineTouchData: LineTouchData(
                                    touchCallback: (FlTouchEvent fiTouchEvent,
                                        LineTouchResponse? lineTouch) async {
                                      HapticFeedback.lightImpact();
                                    },
                                    touchTooltipData: LineTouchTooltipData(
                                      maxContentWidth: 100,
                                      getTooltipColor: (touchedSpot) =>
                                          AppColors.white,
                                      getTooltipItems: (touchedSpots) {
                                        return touchedSpots
                                            .map((LineBarSpot touchedSpot) {
                                          final textStyle =
                                              context.bodyMedium?.copyWith(
                                            color: touchedSpot
                                                    .bar.gradient?.colors[0] ??
                                                touchedSpot.bar.color!,
                                            fontWeight: FontWeight.bold,
                                          );
                                          return LineTooltipItem(
                                            '${touchedSpot.x}, ${touchedSpot.y.toStringAsFixed(2)}',
                                            textStyle!,
                                          );
                                        }).toList();
                                      },
                                    ),
                                    handleBuiltInTouches: true,
                                    getTouchLineEnd: (data, index) => 0,
                                    getTouchLineStart: (data, index) => 0,
                                  ),
                                  lineBarsData: [
                                    LineChartBarData(
                                      color: AppColors.black,
                                      spots: spots2,
                                      isCurved: true,
                                      isStrokeCapRound: true,
                                      barWidth: 3,
                                      belowBarData: BarAreaData(show: false),
                                      dotData: const FlDotData(show: false),
                                    ),
                                  ],
                                  minY: -1,
                                  maxY: 1,
                                  titlesData: FlTitlesData(
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: false,
                                        getTitlesWidget: (value, meta) =>
                                            leftTitleWidgets(value, meta,
                                                constraints.maxWidth),
                                        reservedSize: 56,
                                      ),
                                      drawBelowEverything: true,
                                    ),
                                    rightTitles: const AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: false,
                                        getTitlesWidget: (value, meta) =>
                                            bottomTitleWidgets(value, meta,
                                                constraints.maxWidth),
                                        reservedSize: 36,
                                        interval: 1,
                                      ),
                                      drawBelowEverything: true,
                                    ),
                                    topTitles: const AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                  ),
                                  gridData: FlGridData(
                                    show: true,
                                    drawHorizontalLine: true,
                                    drawVerticalLine: true,
                                    horizontalInterval: 1.5,
                                    verticalInterval: 5,
                                    checkToShowHorizontalLine: (value) =>
                                        value.toInt() == 0,
                                    getDrawingHorizontalLine: (_) => FlLine(
                                      color: AppColors.transparent,
                                      dashArray: [8, 2],
                                      strokeWidth: 0.8,
                                    ),
                                    getDrawingVerticalLine: (_) => FlLine(
                                      color: AppColors.transparent,
                                      dashArray: [8, 2],
                                      strokeWidth: 0.8,
                                    ),
                                    checkToShowVerticalLine: (value) =>
                                        value.toInt() == 0,
                                  ),
                                  borderData: FlBorderData(show: false),
                                )
                              : LineChartData(
                                  lineTouchData: LineTouchData(
                                    touchTooltipData: LineTouchTooltipData(
                                      maxContentWidth: 100,
                                      getTooltipColor: (touchedSpot) =>
                                          AppColors.white,
                                      getTooltipItems: (touchedSpots) {
                                        return touchedSpots
                                            .map((LineBarSpot touchedSpot) {
                                          final textStyle =
                                              context.bodyMedium?.copyWith(
                                            color: touchedSpot
                                                    .bar.gradient?.colors[0] ??
                                                touchedSpot.bar.color!,
                                            fontWeight: FontWeight.bold,
                                          );
                                          return LineTooltipItem(
                                            '${touchedSpot.x}, ${touchedSpot.y.toStringAsFixed(2)}',
                                            textStyle!,
                                          );
                                        }).toList();
                                      },
                                    ),
                                    handleBuiltInTouches: true,
                                    getTouchLineEnd: (data, index) => 0,
                                    getTouchLineStart: (data, index) => 0,
                                  ),
                                  lineBarsData: [
                                    LineChartBarData(
                                      color: AppColors.black,
                                      spots: spots3,
                                      isCurved: true,
                                      isStrokeCapRound: true,
                                      barWidth: 3,
                                      belowBarData: BarAreaData(show: false),
                                      dotData: const FlDotData(show: false),
                                    ),
                                  ],
                                  minY: 1,
                                  maxY: 2.5,
                                  titlesData: FlTitlesData(
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: false,
                                        getTitlesWidget: (value, meta) =>
                                            leftTitleWidgets(value, meta,
                                                constraints.maxWidth),
                                        reservedSize: 56,
                                      ),
                                      drawBelowEverything: true,
                                    ),
                                    rightTitles: const AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: false,
                                        getTitlesWidget: (value, meta) =>
                                            bottomTitleWidgets(value, meta,
                                                constraints.maxWidth),
                                        reservedSize: 36,
                                        interval: 1,
                                      ),
                                      drawBelowEverything: true,
                                    ),
                                    topTitles: const AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                  ),
                                  gridData: FlGridData(
                                    show: true,
                                    drawHorizontalLine: true,
                                    drawVerticalLine: true,
                                    horizontalInterval: 1.5,
                                    verticalInterval: 5,
                                    checkToShowHorizontalLine: (value) =>
                                        value.toInt() == 0,
                                    getDrawingHorizontalLine: (_) => FlLine(
                                      color: AppColors.transparent,
                                      dashArray: [8, 2],
                                      strokeWidth: 0.8,
                                    ),
                                    getDrawingVerticalLine: (_) => FlLine(
                                      color: AppColors.transparent,
                                      dashArray: [8, 2],
                                      strokeWidth: 0.8,
                                    ),
                                    checkToShowVerticalLine: (value) =>
                                        value.toInt() == 0,
                                  ),
                                  borderData: FlBorderData(show: false),
                                ),
                      duration: const Duration(milliseconds: 250),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: List.generate(chartTimes.length, (_index) {
        //     final item = chartTimes[_index];
        //     return GestureDetector(
        //       onTap: () => changeChartTime(item),
        //       child: Padding(
        //         padding: EdgeInsets.symmetric(
        //             horizontal: context.screenWidth * 0.03),
        //         child: Container(
        //           padding: EdgeInsets.symmetric(
        //               horizontal: context.screenWidth * 0.01),
        //           decoration: BoxDecoration(
        //             color: index == item
        //                 ? AppColors.greyVeryLight
        //                 : AppColors.transparent,
        //             borderRadius: BorderRadius.circular(80),
        //           ),
        //           child: Padding(
        //             padding: EdgeInsets.all(context.screenWidth * 0.015),
        //             child: Center(
        //               child: Text(
        //                 item,
        //                 style: context.labelLarge?.copyWith(
        //                   fontWeight: FontWeight.w700,
        //                   color: index == item
        //                       ? AppColors.black
        //                       : AppColors.greyLight,
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     );
        //   }),
        // )
      ],
    );
  }
}
