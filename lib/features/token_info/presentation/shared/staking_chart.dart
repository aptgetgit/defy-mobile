import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/theme/colors.dart'; // Assuming this is your colors file

class StakingChart extends StatefulWidget {
  final Function(double)? onPriceChange;

  const StakingChart({
    super.key,
    this.onPriceChange,
  });

  @override
  State<StakingChart> createState() => _StakingChartState();
}

class _StakingChartState extends State<StakingChart> with SingleTickerProviderStateMixin {
  final List<FlSpot> spots = const <FlSpot>[
    FlSpot(1, 1.2),
    FlSpot(2, 1.3),
    FlSpot(3, 1.5),
    FlSpot(4, 1.45),
    FlSpot(5, 1.4),
    FlSpot(6, 1.7),
    FlSpot(7, 2),
    FlSpot(8, 2.1),
    FlSpot(9, 2.05),
    FlSpot(10, 2),
    FlSpot(11, 2.2),
    FlSpot(12, 2.4),
    FlSpot(13, 1.8),
  ];

  final List<FlSpot> spots3 = const <FlSpot>[
    FlSpot(1, 1.1),
    FlSpot(2, 1.15),
    FlSpot(3, 1.2),
    FlSpot(4, 1.1),
    FlSpot(5, 1.0),
    FlSpot(6, 1.6),
    FlSpot(7, 2.2),
    FlSpot(8, 2.0),
    FlSpot(9, 1.9),
    FlSpot(10, 1.7),
    FlSpot(11, 2.0),
    FlSpot(12, 2.2),
    FlSpot(13, 1.5),
  ];

  final List<FlSpot> spots2 = List.generate(201, (int i) => (i - 100) / 20)
      .map((double x) => FlSpot(x, cos(x)))
      .toList();

  late AnimationController _animationController;
  late Animation<double> _animation;
  List<FlSpot> _animatedSpots = [];
  String? _currentTime; // To store the current time based on touch
  double? _touchX; // To store the x-coordinate of the touch

  String index = '1M';

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    )..addListener(() {
        setState(() {
          _updateAnimatedSpots();
        });
      });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updateAnimatedSpots() {
    List<FlSpot> currentSpots = index == '3M' ? spots : index == '6M' ? spots2 : spots3;
    int totalSpots = currentSpots.length;
    int spotsToShow = (totalSpots * _animation.value).ceil();
    _animatedSpots = currentSpots.take(spotsToShow).toList();
  }

  void changeChartTime(String _index) {
    setState(() {
      index = _index;
      _animatedSpots = [];
      _currentTime = null; // Reset time when changing timeframe
      _touchX = null; // Reset touch position
      _animationController.reset();
      _animationController.forward();
    });
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    if (value % 1 != 0) return Container();
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

  String _getTimeFromSpot(double x, String timeFrame) {
    DateTime now = DateTime.now();
    DateTime resultTime;

    switch (timeFrame) {
      case '1M':
        int daysAgo = (13 - x).round();
        resultTime = now.subtract(Duration(days: daysAgo, hours: 14)); // Adjust for 10:20PM
        break;
      case '3M':
        int daysAgo = (13 - x).round() * 7;
        resultTime = now.subtract(Duration(days: daysAgo, hours: 14));
        break;
      case '6M':
        int daysAgo = (x.abs() * 15).round();
        resultTime = now.subtract(Duration(days: daysAgo, hours: 14));
        break;
      case '1Y':
        int monthsAgo = (13 - x).round();
        resultTime = DateTime(now.year, now.month - monthsAgo, now.day, 22, 20); // 10:20PM
        break;
      case 'ALL':
        int yearsAgo = (13 - x).round();
        resultTime = DateTime(now.year - yearsAgo, now.month, now.day, 22, 20);
        break;
      default:
        resultTime = now;
    }

    // Format time as "MMM dd hh:mm a" (e.g., "Feb 11 10:20PM")
    String month = _getMonthName(resultTime.month);
    String day = resultTime.day.toString().padLeft(2, '0');
    String hour = (resultTime.hour % 12).toString().padLeft(2, '0');
    String minute = resultTime.minute.toString().padLeft(2, '0');
    String period = resultTime.hour >= 12 ? 'PM' : 'AM';
    return '$month $day $hour:$minute$period';
  }

  String _getMonthName(int month) {
    const List<String> months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  final List<String> chartTimes = <String>['1M', '3M', '6M', '1Y', 'ALL'];

  double _getXRangeMin(String index) {
    switch (index) {
      case '6M':
        return spots2.map((spot) => spot.x).reduce((a, b) => a < b ? a : b);
      default:
        return 1.0; // Default min for spots and spots3
    }
  }

  double _getXRangeMax(String index) {
    switch (index) {
      case '6M':
        return spots2.map((spot) => spot.x).reduce((a, b) => a > b ? a : b);
      default:
        return 13.0; // Default max for spots and spots3
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            // Time indicator container
            if (_currentTime != null && _touchX != null)
              Positioned(
                left: (_touchX! - _getXRangeMin(index)) * (MediaQuery.of(context).size.width / (_getXRangeMax(index) - _getXRangeMin(index))) - 50,
                top: 10.h, // Position above the chart
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    _currentTime!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 24.h,
                top: 40.h, // Increased top padding to accommodate the time indicator
              ),
              child: AspectRatio(
                aspectRatio: 2,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) => LineChart(
                    LineChartData(
                      lineTouchData: LineTouchData(
                        touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
                          if (response == null || response.lineBarSpots == null || response.lineBarSpots!.isEmpty) {
                            setState(() {
                              _currentTime = null;
                              _touchX = null;
                            });
                            return;
                          }
                          final LineBarSpot touchedSpot = response.lineBarSpots!.first;
                          final double price = touchedSpot.y;
                          if (widget.onPriceChange != null) widget.onPriceChange!(price);
                          setState(() {
                            _currentTime = _getTimeFromSpot(touchedSpot.x, index);
                            _touchX = touchedSpot.x; // Store the x-coordinate for positioning
                          });
                        },
                        getTouchLineStart: (_, __) => -double.infinity,
                        getTouchLineEnd: (_, __) => double.infinity,
                        touchTooltipData: LineTouchTooltipData(
                          getTooltipColor: (_) => Colors.transparent,
                          getTooltipItems: (_) => [],
                        ),
                        getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
                          if (spotIndexes.isEmpty) return [];
                          return spotIndexes.map((spotIndex) {
                            return TouchedSpotIndicatorData(
                              FlLine(
                                color: Colors.black,
                                strokeWidth: 1.5.w,
                                dashArray: null,
                              ),
                              FlDotData(
                                getDotPainter: (FlSpot spot, double percent, LineChartBarData barData, int index) =>
                                    FlDotCirclePainter(
                                  radius: 6.r,
                                  color: Colors.black,
                                  strokeColor: Colors.black,
                                ),
                              ),
                            );
                          }).toList();
                        },
                      ),
                      lineBarsData: <LineChartBarData>[
                        LineChartBarData(
                          color: Colors.black,
                          spots: _animatedSpots,
                          isCurved: true,
                          isStrokeCapRound: true,
                          barWidth: 3.w,
                          belowBarData: BarAreaData(),
                          dotData: const FlDotData(show: false),
                        ),
                      ],
                      minY: index == '6M' ? -1 : 1,
                      maxY: index == '6M' ? 1 : 2.5,
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            getTitlesWidget: (double value, TitleMeta meta) =>
                                leftTitleWidgets(value, meta, constraints.maxWidth),
                            reservedSize: 56.w,
                          ),
                        ),
                        rightTitles: const AxisTitles(),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            getTitlesWidget: (double value, TitleMeta meta) =>
                                bottomTitleWidgets(value, meta, constraints.maxWidth),
                            reservedSize: 36.h,
                            interval: 1,
                          ),
                        ),
                        topTitles: const AxisTitles(),
                      ),
                      gridData: FlGridData(
                        horizontalInterval: 1.5,
                        verticalInterval: 5,
                        checkToShowHorizontalLine: (double value) => value.toInt() == 0,
                        getDrawingHorizontalLine: (_) => FlLine(
                          color: Colors.transparent,
                          strokeWidth: 0.8.w,
                        ),
                        getDrawingVerticalLine: (_) => FlLine(
                          color: Colors.transparent,
                          strokeWidth: 0.8.w,
                        ),
                        checkToShowVerticalLine: (double value) => false,
                      ),
                      borderData: FlBorderData(show: false),
                    ),
                    duration: const Duration(milliseconds: 150),
                  ),
                ),
              ),
            ),
          ],
        ),
        Gap(32.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Container(
                      height: 32.h,
                      width: 54.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: index == item ? AppColors.blue : AppColors.transparent,
                          width: 1.w,
                        ),
                        color: AppColors.greyVeryLight,
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                        child: Center(
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: index == item ? AppColors.blue : AppColors.greyLight,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}