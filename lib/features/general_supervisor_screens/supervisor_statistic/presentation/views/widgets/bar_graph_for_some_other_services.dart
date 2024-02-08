import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/some_other_services_statistics/bar_data_some_other_services.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/views/function/get_some_other_services_bottom_title.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../function/custom_bar_chart_group_data.dart';
import '../function/custom_bar_touch_tool_tip_data.dart';

class BarGraphForSomeOtherServiecs extends StatelessWidget {
  const BarGraphForSomeOtherServiecs(
      {super.key, required this.someOtherServiecsList});
  final List someOtherServiecsList;
  @override
  Widget build(BuildContext context) {
    BarDataSomeOtherServices barDataSomeOtherServices =
        BarDataSomeOtherServices(
      corals: someOtherServiecsList[0],
      festivalCoordinators: someOtherServiecsList[1],
      scouts: someOtherServiecsList[2],
      counselingCentre: someOtherServiecsList[3],
      deaconsSchool: someOtherServiecsList[4],
    );
    barDataSomeOtherServices.initialzeBarData();
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
                  getSomeOtherServicesBottomTitle(value, meta),
            ),
          ),
        ),
        barGroups: barDataSomeOtherServices.barDataSomeOtherServices
            .map(
              (data) => customBarChartGroupData(data),
            )
            .toList(),
      ),
    );
  }
}
