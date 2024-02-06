import 'package:faithful_servant/core/helper/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../data/kg_statistics/bar_data_kg.dart';
import '../function/get_kg_bottom_title.dart';

class BarGraphKG extends StatelessWidget {
  const BarGraphKG({super.key, required this.kGList});
  final List kGList;
  @override
  Widget build(BuildContext context) {
    BarDataKG barDataKG = BarDataKG(kg1: kGList[0], kg2: kGList[1]);
    barDataKG.initialzeBarData();
    return BarChart(
      BarChartData(
        maxY: 40,
        minY: 0,
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) => getKgBottomTitle(value, meta),
            ),
          ),
        ),
        barGroups: barDataKG.barDataKG
            .map(
              (data) => BarChartGroupData(x: data.x, barRods: [
                BarChartRodData(
                  toY: data.y.toDouble(),
                  color: kPrimaryColor,
                  width: 12,
                  borderRadius: BorderRadius.circular(3),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    color: Colors.grey[400],
                    toY: 40,
                  ),
                ),
              ]),
            )
            .toList(),
      ),
    );
  }
}
