import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/adults_statistics/bar_data_adults.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/views/function/get_adults_bottom_title.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../function/custom_bar_chart_group_data.dart';
import '../function/custom_bar_touch_tool_tip_data.dart';

class BarGraphAdults extends StatelessWidget {
  const BarGraphAdults({super.key, required this.adultsList});
  final List adultsList;
  @override
  Widget build(BuildContext context) {
    BarDataAdults barDataAdults = BarDataAdults(
      students: adultsList[0],
      graduates: adultsList[1],
      people: adultsList[2],
      men: adultsList[3],
    );
    barDataAdults.initialzeBarData();
    return BarChart(
      BarChartData(
        maxY: 40,
        minY: 0,
        alignment: BarChartAlignment.spaceAround,
        barTouchData: BarTouchData(
          enabled: false,
          touchTooltipData: customBarTouchToolTipData(),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
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
                  getAdultsBottomTitle(value, meta),
            ),
          ),
        ),
        barGroups: barDataAdults.barDataAdults
            .map(
              (data) => customBarChartGroupData(data),
            )
            .toList(),
      ),
    );
  }
}
