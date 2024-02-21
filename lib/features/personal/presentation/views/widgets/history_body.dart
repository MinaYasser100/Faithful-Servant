import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/personal/data/repos/services_history_repo_implementation.dart';
import 'package:faithful_servant/features/personal/presentation/manager/history_of_service_cubit/history_of_service_cubit.dart';
import 'package:faithful_servant/features/personal/presentation/views/widgets/show_mode_history_card.dart';
import 'package:faithful_servant/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HistoryOfServiceCubit(ServiceHistoryImplementaion())..init(),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            'تاريخي في الخدمة الكنسية',
            style: Styles.textStyle25SecondColor
                .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
          const Divider(indent: 100, endIndent: 100),
          BlocBuilder<HistoryOfServiceCubit, HistoryOfServiceState>(
            builder: (context, state) {
              if (state is Fetchhistorydataloading) {
                return const LoadingIndicator();
              } else if (state is Fetchhistorydatafailure) {
                return const Text('حدث خطا اثناء جلب البيانات');
              } else if (state is Fetchhistorydatasuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount:
                        HistoryOfServiceCubit.dataListHistoryCards.length,
                    physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    itemBuilder: (context, index) {
                      return HistoryCard(index: index);
                    },
                  ),
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
