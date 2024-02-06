import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/general_manager/presentation/views/widgets/page_cards.dart';
import 'package:faithful_servant/features/general_manager/presentation/views/widgets/quick_summary_space.dart';
import 'package:flutter/material.dart';

class GeneralSupervisorBody extends StatelessWidget {
  const GeneralSupervisorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const QuickSummarySpace(),
        PageCards(screensList: genetalSuperVisorPages),
      ],
    );
  }
}
