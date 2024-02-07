import 'package:faithful_servant/core/helper/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget getPrimaryBottomTitle(double value, TitleMeta titleMeta) {
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text(
        'first'.tr,
        style: Styles.textStyleStatistics,
      );
      break;
    case 1:
      text = Text(
        'second'.tr,
        style: Styles.textStyleStatistics,
      );
      break;
    case 2:
      text = Text(
        'third'.tr,
        style: Styles.textStyleStatistics,
      );
      break;
    case 3:
      text = Text(
        'fourth'.tr,
        style: Styles.textStyleStatistics,
      );
      break;
    case 4:
      text = Text(
        'fifth'.tr,
        style: Styles.textStyleStatistics,
      );
      break;
    case 5:
      text = Text(
        'sixth'.tr,
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
