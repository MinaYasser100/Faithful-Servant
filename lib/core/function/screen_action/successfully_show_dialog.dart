import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

Future<dynamic> successfullyShowDialog({
  required BuildContext context,
  required String contentText,
  required String titleText,
  required String buttonText,
  required Function()? onPressed,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: kDarkSecondColor,
        title: Text(
          titleText,
          style: Styles.textStyle20.copyWith(color: kPrimaryColor),
        ),
        content: Text(
          contentText,
          style: Styles.textStyle16.copyWith(
            color: kSecondColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: const TextStyle(color: kPrimaryColor),
            ),
          ),
        ],
      );
    },
  );
}
