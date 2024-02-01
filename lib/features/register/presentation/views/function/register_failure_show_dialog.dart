import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> registerFailureShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: kDarkSecondColor,
        title: Text(
          'Failure Registration',
          style: Styles.textStyle20.copyWith(color: kPrimaryColor),
        ),
        content: Text(
          ' حدث خطاء اثناء التسجيل يرجي التاكد ان هذا الايميل الحقيقي الخاص بك ثم اعد المحاوله',
          style: Styles.textStyle16.copyWith(
            color: Colors.red,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.offNamed(GetPages.kWelcomeView);
            },
            child: const Text(
              'Try Again',
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
        ],
      );
    },
  );
}
