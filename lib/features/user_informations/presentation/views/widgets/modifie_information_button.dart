import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModifieInformationButton extends StatelessWidget {
  const ModifieInformationButton({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomTextButton(
        textButton: 'Modifie Informaion'.tr,
        onPressed: () {
          Get.toNamed(GetPages.kModifieInformationsView, arguments: userModel);
        },
      ),
    );
  }
}
