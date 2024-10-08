import 'package:faithful_servant/core/function/custom_outline_input_border_method.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldForEdit extends StatelessWidget {
  const CustomTextFormFieldForEdit({
    super.key,
    required this.labelText,
    this.obscureText = false,
    this.suffixOnPressed,
    this.iconData,
    this.validator,
    this.keyboardType,
    required this.textEditingController,
    this.readOnly = false,
     required this.intialValue,
  });
  final String labelText;
  final String intialValue;
  final bool obscureText;
  final void Function()? suffixOnPressed;
  final IconData? iconData;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController textEditingController;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue:intialValue ,
      controller: textEditingController,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      readOnly: readOnly,
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