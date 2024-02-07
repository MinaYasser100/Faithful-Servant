import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/views/widgets/bar_graph_for_adults.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/views/widgets/bar_graph_for_prop_and_sec.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/views/widgets/bar_graph_primary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bar_graph_for_kg.dart';
import 'bar_graph_statistics.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BarGraphStatistics(
                text: 'KG sarvent Statistics : '.tr,
                child: const BarGraphKG(kGList: [8, 20]),
              ),
              const SizedBox(
                height: 40,
              ),
              BarGraphStatistics(
                text: 'primary sarvent statistics : '.tr,
                child: const BarGraphPrimary(
                  primaryList: [20, 34, 15, 0, 28, 30],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              BarGraphStatistics(
                text: 'proparatory and secondary statistics : '.tr,
                child: const BarGraphForPerpAndSec(
                  perpAndSecList: [40, 30, 15, 5],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              BarGraphStatistics(
                text: 'adults statistics : '.tr,
                child: const BarGraphAdults(
                  adultsList: [16, 27, 11, 10],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
