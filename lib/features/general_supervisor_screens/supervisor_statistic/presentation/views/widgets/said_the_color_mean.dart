import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

class SaidTheColorMean extends StatelessWidget {
  const SaidTheColorMean({
    super.key,
    required this.color,
    required this.text,
  });
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: color,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          text,
          style: Styles.textStyle20.copyWith(
            color: kPrimaryColor,
          ),
        )
      ],
    );
  }
}
