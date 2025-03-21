import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      fontSize: min(18, 18 * chartWidth / 300).sp,
    );
    return SideTitleWidget(
      fitInside: SideTitleFitInsideData.fromTitleMeta(meta),
      space: 16.h,
      meta: meta,
      child: Text(meta.formattedValue, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    final TextStyle style = TextStyle(
      color: AppColors.red,
      fontWeight: FontWeight.bold,
      fontSize: min(18, 18 * chartWidth / 300).sp,
    );
    return SideTitleWidget(
      fitInside: SideTitleFitInsideData.fromTitleMeta(meta),
      space: 16.w,
      meta: meta,
      child: Text(meta.formattedValue, style: style),
    );
  }

  String index = '1M';

  void changeChartTime(String _index) {
    setState(() {
      index = _index;
      lastTouchedSpot = null; // Reset the touched spot when changing the chart time
    });
  }

  final List<String> chartTimes = <String>['1M', '3M', '6M', '1Y', '5Y', 'ALL'];

  @override
  Widget build(BuildContext context) => Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                bottom: 24.h,
                top: 20.h,
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
                          maxContentWidth: 100.w,
                          getTooltipColor: (LineBarSpot touchedSpot) => Colors.white,
                          getTooltipItems: (List<LineBarSpot> touchedSpots) => touchedSpots
                              .map((LineBarSpot touchedSpot) {
                            final TextStyle textStyle = TextStyle(
                              color: touchedSpot.bar.gradient?.colors[0] ?? touchedSpot.bar.color!,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            );
                            return LineTooltipItem(
                              '${touchedSpot.x}, ${touchedSpot.y.toStringAsFixed(2)}',
                              textStyle,
                            );
                          }).toList(),
                        ),
                        getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) => spotIndexes.map((int spotIndex) => TouchedSpotIndicatorData(
                              FlLine(
                                color: Colors.black,
                                strokeWidth: 1.5.w,
                              ),
                              FlDotData(
                                getDotPainter: (FlSpot spot, double percent, LineChartBarData barData, int index) => FlDotCirclePainter(
                                    radius: 6.r,
                                    color: Colors.black,
                                    strokeColor: Colors.black,
                                  ),
                              ),
                            ),).toList(),
                      ),
                      lineBarsData: <LineChartBarData>[
                        LineChartBarData(
                          color: Colors.black,
                          spots: index == '3M' ? spots : index == '6M' ? spots2 : spots3,
                          isCurved: true,
                          isStrokeCapRound: true,
                          barWidth: 3.w,
                          belowBarData: BarAreaData(
                            
                          ),
                          dotData: const FlDotData(show: false),
                        ),
                        if (lastTouchedSpot != null)
                          LineChartBarData(
                            color: Colors.grey,
                            spots: (index == '3M' ? spots : index == '6M' ? spots2 : spots3)
                                .where((FlSpot spot) => spot.x >= lastTouchedSpot!.x)
                                .toList(),
                            isCurved: true,
                            isStrokeCapRound: true,
                            barWidth: 3.w,
                            belowBarData: BarAreaData(
                              
                            ),
                            dotData: const FlDotData(show: false),
                          ),
                      ],
                      minY: index == '6M' ? -1 : 1,
                      maxY: index == '6M' ? 1 : 2.5,
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            getTitlesWidget: (double value, TitleMeta meta) => leftTitleWidgets(value, meta, constraints.maxWidth),
                            reservedSize: 56.w,
                          ),
                        ),
                        rightTitles: const AxisTitles(
                          
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            getTitlesWidget: (double value, TitleMeta meta) => bottomTitleWidgets(value, meta, constraints.maxWidth),
                            reservedSize: 36.h,
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
                        getDrawingHorizontalLine: (_) => FlLine(
                          color: Colors.transparent,
                          strokeWidth: 0.8.w,
                        ),
                        getDrawingVerticalLine: (double value) {
                          if (touchedSpots.any((FlSpot spot) => spot.x == value)) {
                            return FlLine(
                              color: Colors.black,
                              strokeWidth: 1.5.w,
                            );
                          }
                          return FlLine(
                            color: Colors.transparent,
                            strokeWidth: 0.8.w,
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
            Positioned(
                right: 20.w,
                bottom: 0,
                child: Text(
                  r'$1,201.23',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyDark,),
                ),),
          ],
        ),
        Gap(32.h),
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
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Container(
                        height: 26.h,
                        width: 44.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: index == item ? AppColors.black : AppColors.transparent,
                              width: 1.w,
                            ),
                          color: index == item ? AppColors.greyVeryLight : AppColors.transparent,
                          borderRadius: BorderRadius.circular(40.r),),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                          child: Center(
                            child: Text(
                              item,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: index == item ? AppColors.black : AppColors.greyLight,),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),),
            IconButton(
              onPressed: () {},
              icon: Icon(PhosphorIconsFill.sliders, color: AppColors.greyLight, size: 20.sp),
            ),
          ],
        ),
      ],
    );
}
