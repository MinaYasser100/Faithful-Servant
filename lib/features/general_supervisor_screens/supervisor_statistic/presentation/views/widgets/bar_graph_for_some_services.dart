import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/some_services/bar_data_some_services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../function/custom_bar_chart_group_data.dart';
import '../function/custom_bar_touch_tool_tip_data.dart';
import '../function/get_some_services_bottom_title.dart';

class BarGraphForSomeServices extends StatelessWidget {
  const BarGraphForSomeServices({super.key, required this.someServicesList});
  final List someServicesList;
  @override
  Widget build(BuildContext context) {
    BarDataSomeServices barDataSomeServices = BarDataSomeServices(
      mothoerDulaji: someServicesList[0],
      wisdoms: someServicesList[1],
      stage: someServicesList[2],
      demonstrationTools: someServicesList[3],
      brothersOfLord: someServicesList[4],
    );
    barDataSomeServices.initialzeBarData();
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
                  getSomeServicesBottomTitle(value, meta),
            ),
          ),
        ),
        barGroups: barDataSomeServices.barDataSomeServices
            .map(
              (data) => customBarChartGroupData(data),
            )
            .toList(),
      ),
    );
  }
}
