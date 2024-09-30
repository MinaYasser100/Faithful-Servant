import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/core/helper/cache_helper.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/helper/notification/notification_subscribe.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

void logoutMethod(BuildContext context) async {
  CacheHelper.removeData(key: kUserId).then((value) async {
    UserModel? userModel = await getUserData();
    doNotificationUnsubscribe(userModel);
    CacheHelper.removeData(key: kHomeView);
    var box = await Hive.openBox<UserModel>(kUserBox);
    await box.clear();
    await box.close();
    Get.offAllNamed(GetPages.kWelcomeView);
  });
}
