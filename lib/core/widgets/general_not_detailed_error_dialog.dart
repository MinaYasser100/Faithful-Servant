import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> errorDialog(BuildContext context, String text) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: kDarkSecondColor,
        title: Text(
          'خطأ في الاتصال',
          style: Styles.textStyle20.copyWith(color: kPrimaryColor),
        ),
        content: Text(
          text,
          style: Styles.textStyle16.copyWith(
            color: kSecondColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'خروج',
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
        ],
      );
    },
  );
}
