import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/general_supervisor_repo/general_supervisor_repo_implement.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/manager/cubit/statistics_cubit.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/views/widgets/supervisor_statistics_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SupervisorStatisticsView extends StatelessWidget {
  const SupervisorStatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: GeneralAppBar(title: "Statistics".tr, appBar: AppBar()),
      body: BlocProvider(
        create: (context) => StatisticsCubit(GeneralSupervisorRepoImpelment())
          ..getAllStatistics(),
        child: const SupervisorStatisticsViewBody(),
      ),
    );
  }
}
