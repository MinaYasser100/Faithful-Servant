import 'package:faithful_servant/core/function/custom_outline_input_border_method.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.labelText,
    this.obscureText = false,
    this.suffixOnPressed,
    this.iconData,
    this.validator,
    this.keyboardType,
    required this.textEditingController,
  });
  final String labelText;
  final bool obscureText;
  final void Function()? suffixOnPressed;
  final IconData? iconData;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: kSecondColor,
        filled: true,
        labelText: labelText,
        suffixIcon: InkWell(
          onTap: suffixOnPressed,
          child: Icon(
            iconData,
            color: kPrimaryColor,
          ),
        ),
        border: customOutlineInputBorderMethod(),
        enabledBorder: customOutlineInputBorderMethod(),
        focusedBorder: customOutlineInputBorderMethod(),
      ),
    );
  }
}
