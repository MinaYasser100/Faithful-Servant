import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ma5dom_info_widget.dart';
import 'servant_info_widget.dart';

class Ma5domeenDetailsBody extends StatelessWidget {
  const Ma5domeenDetailsBody(
      {super.key, required this.ma5domeenModel, required this.namestage});
  final Ma5domeenModel ma5domeenModel;
  final String namestage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Ma5damInfoWidget(ma5domeenModel: ma5domeenModel),
              ServantInfoWidget(ma5domeenModel: ma5domeenModel),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextButton(
          textButton: 'Modifie Informaion'.tr,
          onPressed: () {
            Get.toNamed(GetPages.kEditMa5domeenDataView,
                arguments: ma5domeenModel);
          },
        ),
      ],
    );
  }
}
