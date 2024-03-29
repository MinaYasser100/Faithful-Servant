import 'package:faithful_servant/core/helper/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget getKgBottomTitle(double value, TitleMeta titleMeta) {
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text(
        'kg1'.tr,
        style: Styles.textStyleStatistics,
      );
      break;
    case 1:
      text = Text(
        'kg2'.tr,
        style: Styles.textStyleStatistics,
      );
      break;
    default:
      text = const Text(
        '',
        style: Styles.textStyleStatistics,
      );
  }
  return SideTitleWidget(axisSide: titleMeta.axisSide, child: text);
}
