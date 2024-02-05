import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';

void determineScreenFromPrivilage(UserModel? userModel, BuildContext context) {
  if (userModel!.privilage == 'المشرف العام') {
    Navigator.pushNamedAndRemoveUntil(
      context,
      GetPages.kGeneralSupervisor,
      (route) => false,
    );
  } else if (userModel.privilage == 'امين الخدمة') {
    Navigator.pushNamedAndRemoveUntil(
      context,
      GetPages.generalManager,
      (route) => false,
    );
  } else if (userModel.privilage == 'خادم') {
    Navigator.pushNamedAndRemoveUntil(
      context,
      GetPages.kServantView,
      (route) => false,
    );
  } else {}
}
