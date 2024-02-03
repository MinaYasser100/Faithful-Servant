import 'package:faithful_servant/core/helper/local/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'select_your_language.dart';

class SettingLanguageViewBody extends StatefulWidget {
  const SettingLanguageViewBody({super.key});

  @override
  State<SettingLanguageViewBody> createState() =>
      _SettingLanguageViewBodyState();
}

class _SettingLanguageViewBodyState extends State<SettingLanguageViewBody> {
  AppLocalController appLocalController = Get.find();
  bool isArabicValue = true;
  bool isEngishValue = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SelectYourLanguage(
              text: 'Arabic'.tr,
              isValue: appLocalController.initilalLanguage == const Locale('ar')
                  ? isArabicValue
                  : false,
              onChanged: (value) {
                appLocalController.changeLocalLanguage(codeLanguage: 'ar');
                setState(() {
                  isArabicValue = value;
                  isEngishValue = false;
                });
              }),
          SelectYourLanguage(
              text: 'English'.tr,
              isValue: appLocalController.initilalLanguage == const Locale('en')
                  ? true
                  : isEngishValue,
              onChanged: (value) {
                appLocalController.changeLocalLanguage(codeLanguage: 'en');
                setState(() {
                  isEngishValue = value;
                  isArabicValue = false;
                });
              }),
        ],
      ),
    );
  }
}
