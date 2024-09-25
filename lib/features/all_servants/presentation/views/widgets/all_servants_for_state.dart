import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/design_body.dart';
import 'package:faithful_servant/features/all_servants/presentation/views/widgets/all_servants_body_for_stage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllServantsForStage extends StatelessWidget {
  const AllServantsForStage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentService = Get.arguments as String;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: kSecondColor,
        title: Text(
          currentService,
          style: Styles.textStyle25SecondColor,
        ),
      ),
      body: const DesignBody(
        widget: AllServantsBodyForStage(),
      ),
    );
  }
}
