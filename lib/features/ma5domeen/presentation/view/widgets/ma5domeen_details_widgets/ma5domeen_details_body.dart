import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ma5dom_info_widget.dart';
import 'servant_info_widget.dart';

class Ma5domeenDetailsBody extends StatelessWidget {
  const Ma5domeenDetailsBody({super.key, required this.ma5domeenModel});
  final Ma5domeenModel ma5domeenModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Ma5damInfoWidget(ma5domeenModel: ma5domeenModel),
        Column(
          children: [
            ServantInfoWidget(ma5domeenModel: ma5domeenModel),
            const SizedBox(
              height: 20,
            ),
            CustomTextButton(
              textButton: 'Modifie Informaion'.tr,
              onPressed: () {
                //Get.toNamed(GetPages.addMa5domeenview, arguments: namestage);
              },
            ),
          ],
        ),
      ],
    );
  }
}
