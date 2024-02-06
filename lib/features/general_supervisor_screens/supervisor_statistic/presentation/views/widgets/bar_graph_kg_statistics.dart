import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

class BarGraphStatistics extends StatelessWidget {
  const BarGraphStatistics({
    super.key,
    required this.text,
    required this.child,
  });
  final String text;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Styles.textStyle20.copyWith(
            color: kPrimaryColor,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 180,
          child: child,
        ),
      ],
    );
  }
}
