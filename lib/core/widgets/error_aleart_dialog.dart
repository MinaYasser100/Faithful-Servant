import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AlertDialog errorOnCreatingFile({required String message}) {
  return AlertDialog(
    backgroundColor: kDarkSecondColor,
    title: Text(
      'Failure Registration',
      style: Styles.textStyle20.copyWith(color: kPrimaryColor),
    ),
    content: Text(
      message,
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
}
