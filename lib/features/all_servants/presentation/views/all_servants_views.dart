import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/design_body.dart';
import 'package:faithful_servant/features/all_servants/presentation/views/widgets/all_servants_body_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllServantsViews extends StatelessWidget {
  const AllServantsViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        foregroundColor: kSecondColor,
        backgroundColor: kPrimaryColor,
        title: Text(
          'All servant'.tr,
          style: Styles.textStyle25SecondColor,
        ),
      ),
      body: const DesignBody(
        widget: AllServantsBodyView(),
      ),
    );
  }
}
