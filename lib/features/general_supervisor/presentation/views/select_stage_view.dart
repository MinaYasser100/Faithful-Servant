import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/design_body.dart';
import 'package:faithful_servant/features/general_supervisor/presentation/views/widgets/select_stagebody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectStageview extends StatelessWidget {
  const SelectStageview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Get.offAndToNamed(GetPages.kGeneralSupervisor);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: kSecondColor,
          ),
        ),
        title: const Text(
          "متابعه مخدومين",
          style: Styles.textStyle25SecondColor,
        ),
      ),
      body: DesignBody(
          widget: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SelectStagebody(
          itemCount: currentServiceItems.length - 1,
          numToStart: 0,
        ),
      )),
    );
  }
}
