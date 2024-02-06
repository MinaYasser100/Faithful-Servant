import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/general_manager/presentation/views/widgets/page_cards.dart';
import 'package:faithful_servant/features/general_manager/presentation/views/widgets/quick_summary_space.dart';
import 'package:flutter/material.dart';

class GeneralManagerBody extends StatelessWidget {
  const GeneralManagerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const QuickSummarySpace(),
          PageCards(screensList: pages),
        ],
      ),
    );
  }
}
