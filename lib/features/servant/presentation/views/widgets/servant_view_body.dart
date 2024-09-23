import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/general_manager/presentation/views/widgets/page_cards.dart';
import 'package:flutter/material.dart';

class ServantViewBody extends StatelessWidget {
  const ServantViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageCards(screensList: servantPages),
      ],
    );
  }
}
