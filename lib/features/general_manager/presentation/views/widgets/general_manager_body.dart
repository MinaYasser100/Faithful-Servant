import 'package:faithful_servant/features/general_manager/presentation/views/widgets/page_cards.dart';
import 'package:faithful_servant/features/general_manager/presentation/views/widgets/quick_summary_space.dart';
import 'package:flutter/material.dart';

class GeneralManagerBody extends StatelessWidget {
  const GeneralManagerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          QuickSummarySpace(),
          PageCards(),
        ],
      ),
    );
  }
}
