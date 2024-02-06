import 'package:faithful_servant/features/statistics/presentation/manager/pie_chart_gender_count_cubit/pie_chart_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessStateWidgetPieCount extends StatelessWidget {
  const SuccessStateWidgetPieCount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(width: 10),
                const Text('ذكر'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 10),
                const Text('انثي'),
              ],
            )
          ],
        ),
        PieChart(
          swapAnimationDuration: const Duration(milliseconds: 750),
          swapAnimationCurve: Curves.easeInOut,
          PieChartData(
            sectionsSpace: 0,
            centerSpaceRadius: 90,
            sections: BlocProvider.of<PieChartCubit>(context).piechartdata,
          ),
        ),
      ],
    );
  }
}
