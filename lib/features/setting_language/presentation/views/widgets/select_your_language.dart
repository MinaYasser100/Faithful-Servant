import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

class SelectYourLanguage extends StatelessWidget {
  const SelectYourLanguage({
    super.key,
    required this.isValue,
    this.onChanged,
    required this.text,
  });

  final bool isValue;
  final void Function(bool)? onChanged;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Styles.textStyle30,
        ),
        const Spacer(),
        Switch(
          activeColor: kPrimaryColor,
          value: isValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
