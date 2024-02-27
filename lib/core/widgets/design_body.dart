import 'package:faithful_servant/core/helper/constant.dart';
import 'package:flutter/material.dart';

class DesignBody extends StatelessWidget {
  const DesignBody({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: kSecondColor,
          borderRadius: BorderRadius.circular(bodyRadious),
        ),
        child: widget);
  }
}
