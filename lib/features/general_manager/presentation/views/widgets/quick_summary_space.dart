import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/general_manager/presentation/manager/general_manager_cubit/general_manager_cubit.dart';
import 'package:faithful_servant/features/statistics/presentation/views/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuickSummarySpace extends StatelessWidget {
  const QuickSummarySpace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Center(
            child: Column(
              children: [
                const Text('عدد الخدام بالخدمة',
                    style: Styles.textStyle16SecondColor),
                BlocBuilder<GeneralManagerCubit, GeneralManagerState>(
                  builder: (context, state) {
                    if (state is Generalquicksummaryloading) {
                      return const LoadingIndicator();
                    } else if (state is Generalquicksummarysuccess) {
                      return Text(
                          BlocProvider.of<GeneralManagerCubit>(context)
                              .total
                              .toString(),
                          style: Styles.textStyle30SecondColor);
                    } else {
                      return const Text('Error!',
                          style: Styles.textStyle30SecondColor);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
