import 'package:faithful_servant/core/helper/constant.dart';
import 'package:flutter/material.dart';

import 'bar_graph_kg_statistics.dart';

class SupervisorStatisticsViewBody extends StatelessWidget {
  const SupervisorStatisticsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: kSecondColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BarGraphKGStatistics(),
          ],
        ),
      ),
    );
  }
}
