import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/manager/cubit/statistics_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'supervisor_statistics_by_gender.dart';
import 'supervisor_statistics_for_all_serviecs.dart';

class SupervisorStatisticsViewBodyInformation extends StatelessWidget {
  const SupervisorStatisticsViewBodyInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticsCubit, StatisticsState>(
      builder: (context, state) {
        if (state is StatisticsLoading ||
            state is StatisticsDeaconsSchoolSuccess ||
            state is StatisticsNumberByGenderLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: kSecondColor,
            ),
          );
        } else if (state is StatisticsNumberByGendersuccess) {
          return Container(
            decoration: const BoxDecoration(
              color: kSecondColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SupervisorStatisticsForAllServices(),
                    SupervisorStatisticsByGender(),
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
