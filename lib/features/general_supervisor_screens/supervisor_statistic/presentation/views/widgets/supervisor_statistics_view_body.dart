import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/manager/cubit/statistics_cubit.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/views/widgets/bar_graph_for_adults.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/views/widgets/bar_graph_for_prop_and_sec.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/views/widgets/bar_graph_for_servant.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/views/widgets/bar_graph_for_some_other_services.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/views/widgets/bar_graph_for_some_services.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/views/widgets/bar_graph_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'bar_graph_for_kg.dart';
import 'bar_graph_statistics.dart';

class SupervisorStatisticsViewBody extends StatelessWidget {
  const SupervisorStatisticsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticsCubit, StatisticsState>(
      builder: (context, state) {
        if (state is StatisticsKgLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: kSecondColor,
          ));
        } else if (state is StatisticsMenSuccess) {
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
                      child: BarGraphKG(
                          kGList:
                              BlocProvider.of<StatisticsCubit>(context).kgList),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    BarGraphStatistics(
                      text: 'primary sarvent statistics : '.tr,
                      child: BarGraphPrimary(
                        primaryList: BlocProvider.of<StatisticsCubit>(context)
                            .primaryList,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    BarGraphStatistics(
                      text: 'proparatory and secondary statistics : '.tr,
                      child: BarGraphForPerpAndSec(
                        perpAndSecList:
                            BlocProvider.of<StatisticsCubit>(context)
                                .perAndSecList,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    BarGraphStatistics(
                      text: 'adults statistics : '.tr,
                      child: BarGraphAdults(
                        adultsList: BlocProvider.of<StatisticsCubit>(context)
                            .adultsList,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    BarGraphStatistics(
                      text: 'Servant statistics : '.tr,
                      child: const BarGraphForServant(
                        servantList: [7, 20, 15],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    BarGraphStatistics(
                      text: 'Some services statistics : '.tr,
                      child: const BarGraphForSomeServices(
                        someServicesList: [27, 10, 35, 7, 19],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    BarGraphStatistics(
                      text: 'Some other services statistics : '.tr,
                      child: const BarGraphForSomeOtherServiecs(
                        someOtherServiecsList: [27, 10, 35, 7, 19],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Text(
            'NO Statistics',
            style: Styles.textStyle30,
          );
        }
      },
    );
  }
}
