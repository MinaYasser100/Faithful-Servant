import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/servant_statistics/bar_data_servant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../function/custom_bar_chart_group_data.dart';
import '../function/custom_bar_touch_tool_tip_data.dart';
import '../function/get_servant_bottom_title.dart';

class BarGraphForServant extends StatelessWidget {
  const BarGraphForServant({super.key, required this.servantList});
  final List servantList;
  @override
  Widget build(BuildContext context) {
    BarDataServant barDataServant = BarDataServant(
      servant: servantList[0],
      sundayServants: servantList[1],
      prepareServants: servantList[2],
    );
    barDataServant.initialzeBarData();
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
                  getServantsBottomTitle(value, meta),
            ),
          ),
        ),
        barGroups: barDataServant.barDataServant
            .map(
              (data) => customBarChartGroupData(data),
            )
            .toList(),
      ),
    );
  }
}
