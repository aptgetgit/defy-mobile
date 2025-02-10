import 'package:defy/config/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class NFTCollectionPiechart extends StatefulWidget {
  const NFTCollectionPiechart({super.key});

  @override
  State<NFTCollectionPiechart> createState() => _NFTCollectionPiechartState();
}

class _NFTCollectionPiechartState extends State<NFTCollectionPiechart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) => AspectRatio(
      aspectRatio: 1.2,
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, PieTouchResponse? pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  touchedIndex = -1;
                  return;
                }
                touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
              });
            },
          ),
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 4,
          centerSpaceRadius: 70,
          sections: showingSections(),
        ),
      ),
    );

  List<PieChartSectionData> showingSections() => List.generate(5, (int i) {
      final bool isTouched = i == touchedIndex;
      final double radius = isTouched ? 45.0 : 35.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xffFF6767),
            value: 20.06,
            radius: radius,
            title: '20.06%',
            showTitle: true,
            titlePositionPercentageOffset: 2,
            titleStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xffEA8B4D),
            value: 21.36,
            radius: radius,
            title: '21.36%',
            showTitle: true,
            titlePositionPercentageOffset: 2,
            titleStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xffF49C3B),
            value: 7.08,
            radius: radius,
            title: '7.06%',
            showTitle: true,
            titlePositionPercentageOffset: 2,
            titleStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xffF49C3B),
            value: 6.86,
            radius: radius,
            title: '6.86%',
            showTitle: true,
            titlePositionPercentageOffset: 2,
            titleStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          );
        case 4:
          return PieChartSectionData(
            color: AppColors.greenDark,
            value: 19.49,
            radius: radius + 5,
            title: '19.49%',
            showTitle: true,
            titlePositionPercentageOffset: 2,
            titleStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          );
        default:
          throw Error();
      }
    });
}