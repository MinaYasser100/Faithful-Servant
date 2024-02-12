import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/manager/cubit/statistics_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'pie_graph_for_servants.dart';
import 'said_the_color_mean.dart';

class SupervisorStatisticsByGender extends StatelessWidget {
  const SupervisorStatisticsByGender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          'statistics by gender : '.tr,
          style: Styles.textStyle20.copyWith(
            color: kPrimaryColor,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 200,
          child: PieGraphForServants(
            maleNumber:
                BlocProvider.of<StatisticsCubit>(context).male.toDouble(),
            femaleNumber:
                BlocProvider.of<StatisticsCubit>(context).female.toDouble(),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SaidTheColorMean(
          color: kDarkSecondColor,
          text: 'male'.tr,
        ),
        const SizedBox(
          height: 5,
        ),
        SaidTheColorMean(
          color: kPrimaryLightColor,
          text: 'female'.tr,
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
