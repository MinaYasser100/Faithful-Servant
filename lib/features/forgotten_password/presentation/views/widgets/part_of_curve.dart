import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/local/locale_controller.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartOfCurve extends StatelessWidget {
  const PartOfCurve({
    super.key,
    required this.width,
    required this.text,
  });
  final double width;
  final String text;
  @override
  Widget build(BuildContext context) {
    AppLocalController appLocalController = Get.find();
    return Container(
      height: 85,
      width: width,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: appLocalController.initilalLanguage == const Locale('en')
            ? const BorderRadius.only(
                bottomRight: Radius.circular(120),
              )
            : const BorderRadius.only(
                bottomLeft: Radius.circular(120),
              ),
      ),
      child: Padding(
        padding: appLocalController.initilalLanguage == const Locale('en')
            ? const EdgeInsets.only(
                left: 20.0,
              )
            : const EdgeInsets.only(
                right: 20.0,
              ),
        child: Text(
          text,
          style: Styles.textStyle25SecondColor.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
