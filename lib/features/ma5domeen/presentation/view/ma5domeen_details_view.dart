import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/design_body.dart';
import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/widgets/ma5domeen_details_widgets/ma5domeen_details_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ma5domeenDetailsView extends StatefulWidget {
  const Ma5domeenDetailsView({super.key});

  @override
  State<Ma5domeenDetailsView> createState() => _Ma5domeenDetailsView();
}

class _Ma5domeenDetailsView extends State<Ma5domeenDetailsView> {
  Ma5domeenModel ma5domeenModel = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Get.offAndToNamed(GetPages.selectStageview);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: kSecondColor,
          ),
        ),
        title: Text(
          'Informations'.tr,
          style: Styles.textStyle25SecondColor,
        ),
      ),
      body: DesignBody(
        widget: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Ma5domeenDetailsBody(ma5domeenModel: ma5domeenModel, namestage: '',),
        ),
      ),
    );
  }
}
