import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bar_graph_for_kg.dart';

class BarGraphKGStatistics extends StatelessWidget {
  const BarGraphKGStatistics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'KG sarvent Statistics : '.tr,
          style: Styles.textStyle20.copyWith(
            color: kPrimaryColor,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const SizedBox(
          height: 220,
          child: BarGraphKG(kGList: [8, 20]),
        ),
      ],
    );
  }
}
