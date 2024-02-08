import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/general_manager/presentation/manager/general_manager_cubit/general_manager_cubit.dart';
import 'package:faithful_servant/features/general_manager/presentation/views/widgets/page_cards.dart';
import 'package:faithful_servant/features/general_manager/presentation/views/widgets/quick_summary_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralManagerBody extends StatelessWidget {
  const GeneralManagerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => GeneralManagerCubit()..quickSummary(),
        child: Column(
          children: [
            const QuickSummarySpace(),
            PageCards(screensList: generalServantPage),
          ],
        ),
      ),
    );
  }
}
