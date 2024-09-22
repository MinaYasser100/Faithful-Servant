import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> failureShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: kDarkSecondColor,
        title: Text(
          'Confirm Failure'.tr,
          style: Styles.textStyle20.copyWith(color: kPrimaryColor),
        ),
        content: Text(
          'this is not the confirm word for supervisor general authority'.tr,
          style: Styles.textStyle16.copyWith(
            color: Colors.red,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
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
