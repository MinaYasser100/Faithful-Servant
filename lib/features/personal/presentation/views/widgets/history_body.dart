import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/personal/data/repos/services_history_repo_implementation.dart';
import 'package:faithful_servant/features/personal/presentation/manager/card_cubit/card_edit_or_show_cubit.dart';
import 'package:faithful_servant/features/personal/presentation/manager/history_of_service_cubit/history_of_service_cubit.dart';
import 'package:faithful_servant/features/personal/presentation/views/widgets/edit_mode_history_card.dart';
import 'package:faithful_servant/features/personal/presentation/views/widgets/show_mode_history_card.dart';
import 'package:faithful_servant/features/statistics/presentation/views/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                HistoryOfServiceCubit(ServiceHistoryImplementaion())..init()),
        BlocProvider(create: (context) => CardEditOrShowCubit()),
      ],
      child: Column(
        children: [
          const Text(
            'تاريخي في الخدمة الكنسية',
            style: Styles.textStyle20,
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
                    itemBuilder: (context, index) {
                      return BlocBuilder<CardEditOrShowCubit,
                          CardEditOrShowState>(builder: (context, state) {
                        if (state is CardEdit && index == state.index) {
                          return EditModeHistoryCard(
                              index: index,
                              data: HistoryOfServiceCubit
                                  .dataListHistoryCards[index]);
                        } else {
                          return ShowModeHistoryCard(index: index);
                        }
                      });
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
