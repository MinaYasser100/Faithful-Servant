import 'package:faithful_servant/features/statistics/presentation/manager/pie_chart_gender_count_cubit/pie_chart_cubit.dart';
import 'package:faithful_servant/features/statistics/presentation/views/widgets/loading_indicator.dart';
import 'package:faithful_servant/features/statistics/presentation/views/widgets/success_state_pie_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PieGenderChart extends StatelessWidget {
  const PieGenderChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PieChartCubit, PieChartState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is PieChartFetshDataLoading) {
          return const LoadingIndicator();
        } else if (state is PieChartFetshDatafailed) {
          return const Center(
            child: Text('Error on getting data'),
          );
        } else {
          return const SuccessStateWidgetPieCount();
        }
      },
    );
  }
}
