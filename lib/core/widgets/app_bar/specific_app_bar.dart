import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/navigation_back_button.dart';
import 'package:flutter/material.dart';

import '../../../features/forgotten_password/presentation/views/widgets/part_of_curve.dart';

class SpecificAppBar extends StatelessWidget {
  const SpecificAppBar({
    super.key,
    required this.appBarText,
  });
  final String appBarText;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PartOfCurve(
              width: double.infinity,
              text: '',
            ),
            PartOfCurve(
              width: MediaQuery.of(context).size.width * 0.8,
              text: appBarText,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20,
          ),
          child: NavigationBackButton(
            backgroundColor: kSecondColor,
            iconColor: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
