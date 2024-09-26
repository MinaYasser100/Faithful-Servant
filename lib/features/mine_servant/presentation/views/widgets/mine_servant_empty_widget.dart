import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MineServantEmptyWidget extends StatelessWidget {
  const MineServantEmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'There are no servant yet'.tr,
            style: Styles.textStyle18.copyWith(color: kPrimaryColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
