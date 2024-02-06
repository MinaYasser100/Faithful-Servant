import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/primary_statistics/bar_data_primary.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/views/function/get_primary_bottom_title.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraphPrimary extends StatelessWidget {
  const BarGraphPrimary({super.key, required this.primaryList});
  final List primaryList;
  @override
  Widget build(BuildContext context) {
    BarDataPrimary barDataPrimary = BarDataPrimary(
      primary1: primaryList[0],
      primary2: primaryList[1],
      primary3: primaryList[2],
      primary4: primaryList[3],
      primary5: primaryList[4],
      primary6: primaryList[5],
    );
    barDataPrimary.initialzeBarData();
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
              getTitlesWidget: (value, meta) =>
                  getPrimaryBottomTitle(value, meta),
            ),
          ),
        ),
        barGroups: barDataPrimary.barDataPrimary
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
