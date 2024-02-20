import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/manager/cubit/statistics_cubit.dart';
import 'package:faithful_servant/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

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
          return const LoadingIndicator(
            indicatorColor: kSecondColor,
            textColor: kSecondColor,
          );
        } else if (state is StatisticsNumberByGendersuccess) {
          return Container(
            decoration: const BoxDecoration(
              color: kSecondColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SupervisorStatisticsForAllServices(),
                    const SupervisorStatisticsByGender(),
                    Text(
                      'Print this information'.tr,
                      style: Styles.textStyle20.copyWith(
                        color: kPrimaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomTextButton(
                        onPressed: BlocProvider.of<StatisticsCubit>(context)
                            .openPdfToPrintData,
                        textButton: 'Print'.tr,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
