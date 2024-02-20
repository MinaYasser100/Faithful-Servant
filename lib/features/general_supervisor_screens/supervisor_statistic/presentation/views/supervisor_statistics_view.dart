import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/general_supervisor_statistics_repo/general_supervisor_repo_statistics_implement.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/manager/cubit/statistics_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'widgets/supervisor_statistics_view_body_information.dart';

class SupervisorStatisticsView extends StatelessWidget {
  const SupervisorStatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: GeneralAppBar(title: "Statistics".tr, appBar: AppBar()),
      body: BlocProvider(
        create: (context) =>
            StatisticsCubit(GeneralSupervisorRepoStatisticsImpelment())
              ..getKgStatistics(),
        child: const SupervisorStatisticsViewBodyInformation(),
      ),
    );
  }
}
