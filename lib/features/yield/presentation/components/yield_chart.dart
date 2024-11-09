import 'dart:math';
import 'package:defy/features/yield/data/models/pool_tvl_apr_chart_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class YieldChart extends StatefulWidget {
  final List<PoolTvlAprChartData> data;

  const YieldChart({Key? key, required this.data}) : super(key: key);

  @override
  State<YieldChart> createState() => _YieldChartState();
}

class _YieldChartState extends State<YieldChart> {
  List<FlSpot> aprSpots = [];
  List<FlSpot> tvlSpots = [];
  String selectedRange = "1H";
  String selectedChart = "APR";
  final Map<String, Duration> timeRanges = {
    '1H': const Duration(hours: 1),
    '1D': const Duration(days: 1),
    '1W': const Duration(days: 7),
    '1M': const Duration(days: 30),
    'all': const Duration(days: 60),
  };

  @override
  void initState() {
    super.initState();
    _filterData();
  }

  void _filterData() {
    if (widget.data.isEmpty) return;

    final endTime = DateTime.parse(widget.data.last.createdAt).toUtc();
    final duration = timeRanges[selectedRange] ?? const Duration(days: 1);
    final startTime = endTime.subtract(duration);

    int startIndex = _binarySearch(widget.data, startTime);
    int endIndex = _binarySearch(widget.data, endTime, isStart: false);

    final filteredData = widget.data.sublist(startIndex, endIndex);

    aprSpots = _processData(filteredData, (entry) => entry.apr);
    tvlSpots = _processData(filteredData, (entry) => entry.totalValueLocked);
  }

  List<FlSpot> _processData(List<PoolTvlAprChartData> data, String Function(PoolTvlAprChartData) getValue) {
    return _reduceData(
      data.map((entry) => FlSpot(
        double.tryParse(entry.timestamp) ?? 0,
        double.tryParse(getValue(entry)) ?? 0,
      )).toList(),
      144,
    );
  }

  List<FlSpot> _reduceData(List<FlSpot> spots, int maxPoints) {
    if (spots.length <= maxPoints) return spots;

    double stepSize = spots.length / maxPoints;
    List<FlSpot> reducedSpots = List.generate(maxPoints, (i) => spots[(i * stepSize).floor()]);
    return _smoothSpots(reducedSpots);
  }

  int _binarySearch(List<PoolTvlAprChartData> data, DateTime targetTime, {bool isStart = true}) {
    int low = 0;
    int high = data.length - 1;

    while (low <= high) {
      int mid = low + (high - low) ~/ 2;
      DateTime midTime = DateTime.parse(data[mid].createdAt).toUtc();

      if (midTime.isBefore(targetTime)) {
        low = mid + 1;
      } else if (midTime.isAfter(targetTime)) {
        high = mid - 1;
      } else {
        return mid;
      }
    }

    return isStart ? low : high + 1;
  }

  List<FlSpot> _smoothSpots(List<FlSpot> spots) {
    if (spots.isEmpty) return [];

    return List.generate(spots.length, (i) {
      double sumY = spots[i].y;
      int count = 1;
      if (i > 0) {
        sumY += spots[i - 1].y;
        count++;
      }
      if (i < spots.length - 1) {
        sumY += spots[i + 1].y;
        count++;
      }
      return FlSpot(spots[i].x, sumY / count);
    });
  }

  void _onTimeRangeSelected(String range) {
    setState(() {
      selectedRange = range;
      _filterData();
    });
  }

  void _onChartSelected(String chart) {
    setState(() {
      selectedChart = chart;
    });
  }

  Widget _buildChartToggleButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ['APR', 'TVL'].map((chart) => _buildToggleButton(chart)).toList(),
    );
  }

  Widget _buildToggleButton(String chart) {
    bool isSelected = selectedChart == chart;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: isSelected ? 100 : 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: isSelected ? Colors.grey[200] : Colors.white,
      ),
      child: TextButton(
        onPressed: () => _onChartSelected(chart),
        style: TextButton.styleFrom(shape: const CircleBorder(), padding: EdgeInsets.zero),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.black.withOpacity(0.5),
            fontSize: isSelected ? 16 : 14,
            fontWeight: FontWeight.bold,
          ),
          child: Text(chart),
        ),
      ),
    );
  }

  Widget _buildTimeRangeButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: timeRanges.keys.map((range) => _buildTimeRangeButton(range)).toList(),
    );
  }

  Widget _buildTimeRangeButton(String range) {
    bool isSelected = selectedRange == range;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: MediaQuery.of(context).size.width * 0.115,
      height: MediaQuery.of(context).size.width * 0.115,
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey[200] : Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextButton(
        onPressed: () => _onTimeRangeSelected(range),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.black.withOpacity(0.5),
            fontSize: isSelected ? 16 : 14,
            fontWeight: FontWeight.bold,
          ),
          child: Text(range),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildChart(selectedChart == "APR" ? aprSpots : tvlSpots, 
                    "$selectedChart Chart", 
                    selectedChart == "APR" ? Colors.blue : Colors.green),
        _buildTimeRangeButtons(),
        const Gap(20),
        _buildChartToggleButton(),
      ],
    );
  }

  Widget _buildChart(List<FlSpot> spots, String title, Color color) {
    if (spots.isEmpty) {
      return _buildEmptyChart(title);
    }

    final minY = spots.map((e) => e.y).reduce(min) - 1;
    final maxY = spots.map((e) => e.y).reduce(max) + 1;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0, bottom: 24, right: 0, top: 20),
          child: AspectRatio(
            aspectRatio: 2,
            child: LineChart(_createLineChartData(spots, color, minY, maxY)),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyChart(String title) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 0, bottom: 24, right: 0, top: 20),
          child: AspectRatio(
            aspectRatio: 2,
            child: Center(
              child: Text(
                'No data available',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ),
          ),
        ),
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  LineChartData _createLineChartData(List<FlSpot> spots, Color color, double minY, double maxY) {
    return LineChartData(
      lineTouchData: _createLineTouchData(color),
      gridData: _createGridData(),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      lineBarsData: [_createLineChartBarData(spots, color)],
      minY: minY,
      maxY: maxY,
    );
  }

  LineTouchData _createLineTouchData(Color color) {
    return LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        maxContentWidth: 180,
        getTooltipColor: (_) => Colors.white,
        getTooltipItems: (touchedSpots) {
          return touchedSpots.map((LineBarSpot touchedSpot) {
            final dateTime = DateTime.fromMillisecondsSinceEpoch(touchedSpot.x.toInt() * 1000);
            final formattedDate = _formatDate(dateTime);
            return LineTooltipItem(
              '$formattedDate: ${touchedSpot.y.toStringAsFixed(2)}',
              TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 14),
            );
          }).toList();
        },
      ),
      handleBuiltInTouches: true,
    );
  }

  String _formatDate(DateTime dateTime) {
    return (selectedRange == 'all' || selectedRange == '1M' || selectedRange == '1W')
        ? '${dateTime.toLocal().day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}'
        : '${dateTime.hour}:${dateTime.minute}';
  }

  FlGridData _createGridData() {
    return FlGridData(
      show: true,
      drawHorizontalLine: true,
      drawVerticalLine: true,
      horizontalInterval: 1.5,
      verticalInterval: 5,
      checkToShowHorizontalLine: (value) => value.toInt() == 0,
      getDrawingHorizontalLine: (_) => const FlLine(
        color: Colors.transparent,
        dashArray: [8, 2],
        strokeWidth: 0.8,
      ),
      getDrawingVerticalLine: (_) => const FlLine(
        color: Colors.transparent,
        dashArray: [8, 2],
        strokeWidth: 0.8,
      ),
      checkToShowVerticalLine: (value) => value.toInt() == 0,
    );
  }

  LineChartBarData _createLineChartBarData(List<FlSpot> spots, Color color) {
    return LineChartBarData(
      color: color,
      spots: spots,
      isCurved: true,
      isStrokeCapRound: true,
      barWidth: 3,
      belowBarData: BarAreaData(show: false),
      dotData: const FlDotData(show: false),
    );
  }
}