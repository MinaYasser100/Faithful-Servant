import 'package:faithful_servant/core/helper/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget getSomeOtherServicesBottomTitle(double value, TitleMeta titleMeta) {
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text(
        'Corals'.tr,
        style: Styles.textStyleStatistics,
      );
      break;
    case 1:
      text = Text(
        'Festival'.tr,
        style: Styles.textStyleStatistics,
      );
      break;
    case 2:
      text = Text(
        'Scouts'.tr,
        style: Styles.textStyleStatistics,
      );
      break;
    case 3:
      text = Text(
        'Counseling'.tr,
        style: Styles.textStyleStatistics,
      );
      break;
    case 4:
      text = Text(
        'Deacon'.tr,
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
