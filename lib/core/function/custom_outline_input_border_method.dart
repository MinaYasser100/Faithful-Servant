import 'package:faithful_servant/core/helper/constant.dart';
import 'package:flutter/material.dart';

OutlineInputBorder customOutlineInputBorderMethod() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(
      color: kPrimaryColor,
    ),
  );
}
