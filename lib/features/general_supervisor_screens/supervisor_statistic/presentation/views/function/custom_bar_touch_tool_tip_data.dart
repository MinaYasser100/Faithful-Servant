import 'package:faithful_servant/core/helper/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

BarTouchTooltipData customBarTouchToolTipData() {
  return BarTouchTooltipData(
    tooltipBgColor: Colors.transparent,
    tooltipPadding: EdgeInsets.zero,
    tooltipMargin: 8,
    getTooltipItem: (group, groupIndex, rod, rodIndex) {
      return BarTooltipItem(
        rod.toY.round().toString(),
        const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
      );
    },
  );
}
