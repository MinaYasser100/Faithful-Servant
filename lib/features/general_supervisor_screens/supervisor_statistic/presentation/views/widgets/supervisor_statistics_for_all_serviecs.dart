import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/manager/cubit/statistics_cubit.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/views/widgets/bar_graph_statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';

import 'bar_graph_for_adults.dart';
import 'bar_graph_for_kg.dart';
import 'bar_graph_for_prop_and_sec.dart';
import 'bar_graph_for_servant.dart';
import 'bar_graph_for_some_other_services.dart';
import 'bar_graph_for_some_services.dart';
import 'bar_graph_primary.dart';

class SupervisorStatisticsForAllServices extends StatelessWidget {
  const SupervisorStatisticsForAllServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BarGraphStatistics(
          text: 'KG sarvent Statistics : '.tr,
          child: BarGraphKG(
              kGList: BlocProvider.of<StatisticsCubit>(context).kgList),
        ),
        const SizedBox(
          height: 40,
        ),
        BarGraphStatistics(
          text: 'primary sarvent statistics : '.tr,
          child: BarGraphPrimary(
            primaryList: BlocProvider.of<StatisticsCubit>(context).primaryList,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        BarGraphStatistics(
          text: 'proparatory and secondary statistics : '.tr,
          child: BarGraphForPerpAndSec(
            perpAndSecList:
                BlocProvider.of<StatisticsCubit>(context).perAndSecList,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        BarGraphStatistics(
          text: 'adults statistics : '.tr,
          child: BarGraphAdults(
            adultsList: BlocProvider.of<StatisticsCubit>(context).adultsList,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        BarGraphStatistics(
          text: 'Servant statistics : '.tr,
          child: BarGraphForServant(
            servantList: BlocProvider.of<StatisticsCubit>(context).servantList,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        BarGraphStatistics(
          text: 'Some services statistics : '.tr,
          child: BarGraphForSomeServices(
            someServicesList:
                BlocProvider.of<StatisticsCubit>(context).someServicesList,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        BarGraphStatistics(
          text: 'Some other services statistics : '.tr,
          child: BarGraphForSomeOtherServiecs(
            someOtherServiecsList:
                BlocProvider.of<StatisticsCubit>(context).someOtherServicesList,
          ),
        ),
      ],
    );
  }
}
