import 'package:faithful_servant/core/helper/cache_helper.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void determineScreenFromPrivilage(
    UserModel? userModel, BuildContext context) async {
  if (userModel!.privilage == 'المشرف العام') {
    Get.toNamed(GetPages.kConfirmValidityView, arguments: userModel);
    await CacheHelper.saveData(key: kHomeView, value: GetPages.kLoginView);
  } else if (userModel.privilage == 'امين الخدمة') {
    Navigator.pushNamedAndRemoveUntil(
      context,
      GetPages.generalManager,
      (route) => false,
    );
    await CacheHelper.saveData(key: kHomeView, value: GetPages.generalManager);
    await CacheHelper.saveData(key: kUserId, value: userModel.userID);
    userToken = userModel.userID;
  } else if (userModel.privilage == 'خادم') {
    Navigator.pushNamedAndRemoveUntil(
      context,
      GetPages.kServantView,
      (route) => false,
    );
    await CacheHelper.saveData(key: kHomeView, value: GetPages.kServantView);
    await CacheHelper.saveData(key: kUserId, value: userModel.userID);
    userToken = userModel.userID;
  } else if (userModel.privilage == 'امين قطاع') {
    Navigator.pushNamedAndRemoveUntil(
      context,
      GetPages.kFeudalCustodianView,
      (route) => false,
    );
    await CacheHelper.saveData(
        key: kHomeView, value: GetPages.kFeudalCustodianView);
    await CacheHelper.saveData(key: kUserId, value: userModel.userID);
    userToken = userModel.userID;
  } else {}
}
