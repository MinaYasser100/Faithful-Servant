import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/individual_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

BarChartGroupData customBarChartGroupData(IndiviualBar data) {
  return BarChartGroupData(
    x: data.x,
    barRods: [
      BarChartRodData(
        toY: data.y.toDouble(),
        color: kPrimaryColor,
        width: 30,
        borderRadius: BorderRadius.circular(3),
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          color: Colors.grey[400],
          toY: 40,
        ),
      ),
    ],
    showingTooltipIndicators: [0],
  );
}
