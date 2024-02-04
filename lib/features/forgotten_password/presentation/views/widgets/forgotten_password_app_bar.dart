import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/navigation_back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'part_of_curve.dart';

class ForgottenPasswordAppBar extends StatelessWidget {
  const ForgottenPasswordAppBar({
    super.key,
  });

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
              text: "Forgotten Password".tr,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 10,
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
