import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/general_manager/presentation/views/widgets/page_cards.dart';
import 'package:faithful_servant/features/general_supervisor/presentation/views/widgets/number_of_servants.dart';
import 'package:flutter/material.dart';

class GeneralSupervisorBody extends StatelessWidget {
  const GeneralSupervisorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NumberOfServants(),
        PageCards(screensList: genetalSuperVisorPages),
      ],
    );
  }
}
