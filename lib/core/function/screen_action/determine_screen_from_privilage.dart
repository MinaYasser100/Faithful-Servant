import 'package:faithful_servant/core/helper/cache_helper.dart';
import 'package:faithful_servant/core/helper/constant.dart';
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
    CacheHelper.saveData(key: kHomeView, value: GetPages.kGeneralSupervisor);
  } else if (userModel.privilage == 'امين الخدمة') {
    Navigator.pushNamedAndRemoveUntil(
        context, GetPages.generalManager, (route) => false,
        arguments: userModel);
    CacheHelper.saveData(key: kHomeView, value: GetPages.generalManager);
  } else if (userModel.privilage == 'خادم') {
    Navigator.pushNamedAndRemoveUntil(
      context,
      GetPages.kServantView,
      (route) => false,
    );
    CacheHelper.saveData(key: kHomeView, value: GetPages.kServantView);
  } else if (userModel.privilage == 'امين قطاع') {
    Navigator.pushNamedAndRemoveUntil(
      context,
      GetPages.kFeudalCustodianView,
      (route) => false,
    );
    CacheHelper.saveData(key: kHomeView, value: GetPages.kFeudalCustodianView);
  } else {}
}
