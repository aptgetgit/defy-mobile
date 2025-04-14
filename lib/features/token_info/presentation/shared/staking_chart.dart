import 'dart:math' show min;
import 'dart:async';
import 'dart:math' show min, cos;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/theme/colors.dart';

class StakingChart extends StatefulWidget {
  final Function(double)? onPriceChange; // Non-animated price updates
  final Function(double)? onPriceChangeWithAnimation; // Animated price updates
  final Function(double)? onBaselineValueChange;
  final bool freezeUpdates; // Add this parameter

  const StakingChart({
    super.key,
    this.onPriceChange,
    this.onPriceChangeWithAnimation,
    this.onBaselineValueChange, 
    required Function(double baselineValue) onBaselineValueBalance,
    this.freezeUpdates = false, // Default to false
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
    FlSpot(1, 1.10),
    FlSpot(1.4, 1.12),
    FlSpot(1.8, 1.14),
    FlSpot(2, 1.15),
    FlSpot(2.3, 1.17),
    FlSpot(2.6, 1.18),
    FlSpot(3, 1.20),
    FlSpot(3.4, 1.19),
    FlSpot(3.8, 1.16),
    FlSpot(4, 1.10),
    FlSpot(4.3, 1.06),
    FlSpot(4.7, 1.02),
    FlSpot(5, 1.00),
    FlSpot(5.4, 1.03),
    FlSpot(5.8, 1.08),
    FlSpot(6, 1.60),
    FlSpot(6.3, 1.85),
    FlSpot(6.7, 2.0),
    FlSpot(7, 2.20),
    FlSpot(7.4, 2.17),
    FlSpot(7.8, 2.10),
    FlSpot(8, 2.00),
    FlSpot(8.3, 1.97),
    FlSpot(8.7, 1.93),
    FlSpot(9, 1.90),
    FlSpot(9.4, 1.85),
    FlSpot(9.8, 1.80),
    FlSpot(10, 1.70),
    FlSpot(10.3, 1.75),
    FlSpot(10.7, 1.85),
    FlSpot(11, 2.00),
    FlSpot(11.4, 2.10),
    FlSpot(11.8, 2.15),
    FlSpot(12, 2.20),
    FlSpot(12.3, 2.10),
    FlSpot(12.7, 1.80),
    FlSpot(13, 1.50),
  ];

  final List<FlSpot> spots2 = List.generate(201, (int i) => (i - 100) / 20)
      .map((double x) => FlSpot(x, cos(x)))
      .toList();

  late AnimationController _animationController;
  late Animation<double> _animation;
  List<FlSpot> _animatedSpots = [];
  String? _currentTime;
  double? _touchX;

  String index = '1M';

  Timer? _endPointTimer;
  bool _isUserTouching = false;
  bool _isDragging = false;
  DateTime? _lastTouchTime;

  late LineChartData _lineChartData;

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
          updateAnimatedSpots();
        });
      });

    _animatedSpots = [];
    _lineChartData = LineChartData(
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
      minY: index == '1Y' || index == 'All' ? 1 : 1,
      maxY: index == '1Y' || index == 'All' ? 2.5 : 2.5,
      titlesData: const FlTitlesData(show: false),
      gridData: const FlGridData(show: false),
      borderData: FlBorderData(show: false),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<FlSpot> initialSpots = _getCurrentSpots();
      if (initialSpots.isNotEmpty) {
        widget.onBaselineValueChange?.call(initialSpots.first.y);
        widget.onPriceChange?.call(initialSpots.last.y); 
        Future.delayed(const Duration(milliseconds: 1600), () {
          if (!_isUserTouching && mounted) {
            widget.onPriceChangeWithAnimation?.call(initialSpots.last.y);
          }
        });
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _endPointTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  List<FlSpot> _getCurrentSpots() {
    switch (index) {
      case '1D':
        return spots3;
      case '1W':
      case '1M':
        return spots;
      case '1Y':
        return spots2.map((spot) => FlSpot(spot.x, 1 + (spot.y + 1) / 2)).toList();
      case 'All':
        return spots3;
      default:
        return spots;
    }
  }

  void updateAnimatedSpots() {
    if (widget.freezeUpdates) return;

    List<FlSpot> currentSpots = _getCurrentSpots();
    int totalSpots = currentSpots.length;
    int spotsToShow = (totalSpots * _animation.value).ceil();
    _animatedSpots = currentSpots.take(spotsToShow).toList();

    _lineChartData = LineChartData(
      lineTouchData: LineTouchData(
        enabled: !widget.freezeUpdates,
        touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
          if (widget.freezeUpdates) return;

          if (event is FlTapDownEvent || event is FlPanStartEvent || event is FlLongPressStart) {
            _endPointTimer?.cancel();
            setState(() {
              _isUserTouching = true;
              _isDragging = false;
              _lastTouchTime = DateTime.now();
            });
          } else if (event is FlPanUpdateEvent) {
            _endPointTimer?.cancel();
            setState(() {
              _isUserTouching = true;
              _isDragging = true;
            });
          } else if (event is FlTapUpEvent || event is FlPanEndEvent || event is FlLongPressEnd || event is FlPointerExitEvent) {
            setState(() {
              _isUserTouching = false;
              _isDragging = false;
            });
            
            _endPointTimer?.cancel();
            _endPointTimer = Timer(const Duration(milliseconds: 1000), () {
              _moveToEndPoint();
            });
            
            Timer(const Duration(milliseconds: 100), _clearTimeIndicator);
          }

          if (response == null || response.lineBarSpots == null || response.lineBarSpots!.isEmpty) {
            if (!_isUserTouching) {
              _clearTimeIndicator();
            }
            return;
          }

          final LineBarSpot touchedSpot = response.lineBarSpots!.first;
          final double price = touchedSpot.y;

          if (event is FlTapDownEvent && widget.onPriceChangeWithAnimation != null) {
            widget.onPriceChangeWithAnimation!(price);
          } else if (event is FlPanUpdateEvent && widget.onPriceChange != null) {
            widget.onPriceChange!(price);
          } else if ((event is FlTapUpEvent || event is FlPanEndEvent) && widget.onPriceChangeWithAnimation != null) {
            widget.onPriceChangeWithAnimation!(price);
          }

          setState(() {
            _currentTime = _getTimeFromSpot(touchedSpot.x, index);
            _touchX = touchedSpot.x;
          });
        },
        getTouchLineStart: (_, __) => -double.infinity,
        getTouchLineEnd: (_, __) => double.infinity,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (_) => Colors.transparent,
          getTooltipItems: (touchedSpots) => List.generate(touchedSpots.length, (_) => null),
        ),
        getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
          if (spotIndexes.isEmpty) return [];
          return spotIndexes.map((spotIndex) => TouchedSpotIndicatorData(
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
            )).toList();
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
      minY: index == '1Y' || index == 'All' ? 1 : 1,
      maxY: index == '1Y' || index == 'All' ? 2.5 : 2.5,
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            getTitlesWidget: (double value, TitleMeta meta) =>
                leftTitleWidgets(value, meta, 300),
            reservedSize: 56.w,
          ),
        ),
        rightTitles: const AxisTitles(),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            getTitlesWidget: (double value, TitleMeta meta) =>
                bottomTitleWidgets(value, meta, 300),
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
    );

    if (_animation.value >= 0.99 && !_isUserTouching && _endPointTimer == null) {
      _endPointTimer = Timer(const Duration(milliseconds: 300), () {
        _moveToEndPoint();
      });
    }
  }

  void changeChartTime(String _index) {
    setState(() {
      index = _index;
      _animatedSpots = [];
      _currentTime = null;
      _touchX = null;
      _animationController.reset();
      _animationController.forward();

      List<FlSpot> currentSpots = _getCurrentSpots();
      if (currentSpots.isNotEmpty) {
        widget.onBaselineValueChange?.call(currentSpots.first.y);
      }
      
      _lineChartData = LineChartData(
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
        minY: index == '1Y' || index == 'All' ? 1 : 1,
        maxY: index == '1Y' || index == 'All' ? 2.5 : 2.5,
        titlesData: const FlTitlesData(show: false),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _endPointTimer?.cancel();
      _endPointTimer = Timer(const Duration(milliseconds: 1800), () {
        _moveToEndPoint();
      });
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
      case '1D':
        int hoursAgo = (13 - x).round() * 2;
        resultTime = now.subtract(Duration(hours: hoursAgo, minutes: (now.minute % 30)));
        break;
      case '1W':
        int daysAgo = (13 - x).round();
        resultTime = now.subtract(Duration(days: daysAgo, hours: 14));
        break;
      case '1M':
        int daysAgo = (13 - x).round() * 2;
        resultTime = now.subtract(Duration(days: daysAgo, hours: 14));
        break;
      case '1Y':
        int monthsAgo = (13 - x).round();
        resultTime = DateTime(now.year, now.month - monthsAgo, now.day, 22, 20);
        break;
      case 'All':
        int monthsAgo = (13 - x).round() * 3;
        resultTime = DateTime(now.year, now.month - monthsAgo, now.day, 22, 20);
        break;
      default:
        resultTime = now;
    }

    String month = _getMonthName(resultTime.month);
    String day = resultTime.day.toString().padLeft(2, '0');
    String hour = (resultTime.hour % 12 == 0 ? 12 : resultTime.hour % 12).toString().padLeft(2, '0');
    String minute = resultTime.minute.toString().padLeft(2, '0');
    String period = resultTime.hour >= 12 ? 'PM' : 'AM';

    if (timeFrame == '1D') {
      return '$hour:$minute$period';
    } else if (timeFrame == '1W') {
      return '$month $day $hour:$minute$period';
    } else {
      return '$month $day $hour:$minute$period';
    }
  }

  String _getMonthName(int month) {
    const List<String> months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  final List<String> chartTimes = <String>['1D', '1W', '1M', '1Y', 'All'];

  double _getXRangeMin(String index) {
    switch (index) {
      case '1Y':
        return spots2.map((spot) => spot.x).reduce((a, b) => a < b ? a : b);
      case 'All':
        return 1.0;
      default:
        return 1.0;
    }
  }

  double _getXRangeMax(String index) {
    switch (index) {
      case '1Y':
        return spots2.map((spot) => spot.x).reduce((a, b) => a > b ? a : b);
      case 'All':
        return 13.0;
      default:
        return 13.0;
    }
  }

  void _moveToEndPoint() {
    if (_animatedSpots.isEmpty) return;

    final FlSpot lastSpot = _animatedSpots.last;

    if (widget.onPriceChangeWithAnimation != null) {
      widget.onPriceChangeWithAnimation!(lastSpot.y);
    }
    
    if (_lastTouchTime == null) {
    }
    
    _clearTimeIndicator();
  }

  void _clearTimeIndicator() {
    if (!_isUserTouching && mounted) {
      setState(() {
        _currentTime = null;
        _touchX = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.freezeUpdates) {
      return _buildFrozenChart(context);
    }
    return _buildInteractiveChart(context);
  }

  Widget _buildFrozenChart(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRect(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 24.h,
              top: 38.h,
            ),
            child: AspectRatio(
              aspectRatio: 2,
              child: LineChart(
                _lineChartData,
              ),
            ),
          ),
        ),
        Gap(2.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(chartTimes.length, (int _index) {
              final String item = chartTimes[_index];
              return Container(
                height: 32.h,
                width: 54.w,
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: index == item ? AppColors.blue : AppColors.transparent,
                    width: 1.w,
                  ),
                  color: AppColors.greyVeryLight,
                  borderRadius: BorderRadius.circular(40.r),
                ),
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
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildInteractiveChart(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRect(
          child: Stack(
            children: <Widget>[
              if (_currentTime != null && _touchX != null)
                Positioned(
                  left: (_touchX! - _getXRangeMin(index)) * (MediaQuery.of(context).size.width / (_getXRangeMax(index) - _getXRangeMin(index))) - 50,
                  top: 4.h,
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
                  top: 38.h,
                ),
                child: AspectRatio(
                  aspectRatio: 2,
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) => LineChart(
                      _lineChartData,
                      duration: const Duration(milliseconds: 150),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Gap(2.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(chartTimes.length, (int _index) {
              final String item = chartTimes[_index];
              return GestureDetector(
                onTap: () {
                  changeChartTime(item);
                },
                child: Container(
                  height: 32.h,
                  width: 54.w,
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: index == item ? AppColors.blue : AppColors.transparent,
                      width: 1.w,
                    ),
                    color: AppColors.greyVeryLight,
                    borderRadius: BorderRadius.circular(40.r),
                  ),
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
              );
            }),
          ),
        ),
      ],
    );
  }
}