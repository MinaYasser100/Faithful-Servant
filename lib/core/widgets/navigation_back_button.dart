import 'package:faithful_servant/core/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBackButton extends StatelessWidget {
  const NavigationBackButton({
    super.key,
    this.backgroundColor = kPrimaryColor,
    this.iconColor = kSecondColor,
  });
  final Color backgroundColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
