import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/feudal_custodian/feual_custodian_view/presentaion/views/widgets/number_of_servent_for_feudal.dart';
import 'package:faithful_servant/features/general_manager/presentation/views/widgets/page_cards.dart';
import 'package:flutter/material.dart';

class FeudalCustodianViewBody extends StatelessWidget {
  const FeudalCustodianViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NumberOfServentForFeudal(),
        PageCards(screensList: feudalCustodinPages),
      ],
    );
  }
}
