import 'package:faithful_servant/core/helper/constant.dart';
import 'package:flutter/material.dart';

class CustomNatificationTextFormField extends StatelessWidget {
  const CustomNatificationTextFormField({
    super.key,
    required this.maxLines,
    required this.labelText,
    required this.controller,
  });
  final int maxLines;
  final String labelText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: _customOutLineInputBorder(),
        enabledBorder: _customOutLineInputBorder(),
        focusedBorder: _customOutLineInputBorder(),
        disabledBorder: _customOutLineInputBorder(),
        errorBorder: _customOutLineInputBorder(),
        focusedErrorBorder: _customOutLineInputBorder(),
        labelText: labelText,
      ),
    );
  }

  OutlineInputBorder _customOutLineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(14),
      ),
      borderSide: BorderSide(color: kPrimaryColor, width: 2),
    );
  }
}
