import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/preparatory_and_secondary_statistics/bar_data_prop_and_sec_statistics.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/views/function/get_pre_sec_bottom_title.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../function/custom_bar_chart_group_data.dart';
import '../function/custom_bar_touch_tool_tip_data.dart';

class BarGraphForPerpAndSec extends StatelessWidget {
  const BarGraphForPerpAndSec({super.key, required this.perpAndSecList});
  final List perpAndSecList;
  @override
  Widget build(BuildContext context) {
    BarDataPreparatoryAndSecondary barDataPreparatoryAndSecondary =
        BarDataPreparatoryAndSecondary(
      sec1: perpAndSecList[0],
      sec2: perpAndSecList[1],
      pro1: perpAndSecList[2],
      pro2: perpAndSecList[3],
    );
    barDataPreparatoryAndSecondary.initialzeBarData();
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
                  getPreSecBottomTitle(value, meta),
            ),
          ),
        ),
        barGroups: barDataPreparatoryAndSecondary.barDataKG
            .map(
              (data) => customBarChartGroupData(data),
            )
            .toList(),
      ),
    );
  }
}
