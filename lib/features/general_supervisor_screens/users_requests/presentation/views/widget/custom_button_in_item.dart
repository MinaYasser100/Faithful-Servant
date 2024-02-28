import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonInItem extends StatelessWidget {
  const CustomButtonInItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kSecondColor, borderRadius: BorderRadius.circular(30)),
      child: TextButton(
        onPressed: () {},
        child: Text(
          'APPLY'.tr,
          style: Styles.textStyle20,
        ),
      ),
    );
  }
}
