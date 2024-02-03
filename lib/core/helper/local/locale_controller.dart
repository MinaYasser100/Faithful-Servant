import 'package:faithful_servant/core/helper/cache_helper.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLocalController extends GetxController {
  Locale initilalLanguage = CacheHelper.getData(key: languageKey) == 'en'
      ? const Locale('en')
      : const Locale('ar');

  void changeLocalLanguage({required String codeLanguage}) {
    Locale locale = Locale(codeLanguage);
    CacheHelper.saveData(key: languageKey, value: codeLanguage);
    Get.updateLocale(locale);
  }
}
