import 'package:faithful_servant/core/helper/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieGraphForServants extends StatelessWidget {
  const PieGraphForServants(
      {super.key, required this.maleNumber, required this.femaleNumber});
  final double maleNumber;
  final double femaleNumber;
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: maleNumber,
            color: kDarkSecondColor,
            titleStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          PieChartSectionData(
            value: femaleNumber,
            color: kPrimaryLightColor,
            titleStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
