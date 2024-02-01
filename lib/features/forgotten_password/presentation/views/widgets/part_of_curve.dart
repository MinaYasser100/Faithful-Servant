import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

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
    return Container(
      height: 70,
      width: width,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(120),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
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
