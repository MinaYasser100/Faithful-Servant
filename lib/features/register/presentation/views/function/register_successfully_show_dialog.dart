import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> registerSuccessfullyShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: kDarkSecondColor,
        title: Text(
          'Successfully Registration',
          style: Styles.textStyle20.copyWith(color: kPrimaryColor),
        ),
        content: Text(
          'لقد نجحت عملية التسجيل يمكنك الان الدهاب الي صفحة تسجيل الدخول',
          style: Styles.textStyle16.copyWith(
            color: kSecondColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.offNamed(GetPages.kLoginView);
            },
            child: const Text(
              'Go To Login',
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
        ],
      );
    },
  );
}
