import 'package:faithful_servant/core/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBackButton extends StatelessWidget {
  const NavigationBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: CircleAvatar(
        backgroundColor: kPrimaryColor,
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
