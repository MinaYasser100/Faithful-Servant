import 'package:faithful_servant/core/function/validator/email_validator.dart';
import 'package:faithful_servant/core/function/validator/name_validator.dart';
import 'package:faithful_servant/core/function/validator/phone_validator.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/features/register/presentation/views/widgets/register_view_body_constent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionOneInRegister extends StatelessWidget {
  const SectionOneInRegister({
    super.key,
    required this.widget,
  });

  final ReisterViewBodyContent widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFromField(
          textEditingController: widget.nameController,
          labelText: 'Name'.tr,
          keyboardType: TextInputType.name,
          validator: nameValidator,
        ),
        const SizedBox(height: 15),
        CustomTextFromField(
          textEditingController: widget.emailController,
          labelText: 'email'.tr,
          keyboardType: TextInputType.emailAddress,
          validator: emailValidator,
        ),
        const SizedBox(height: 15),
        CustomTextFromField(
          textEditingController: widget.phoneNum1Controller,
          labelText: 'Phone number 1'.tr,
          validator: phoneValidator,
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 15),
        CustomTextFromField(
          textEditingController: widget.phoneNum2Controller,
          labelText: 'Phone number 2'.tr,
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }
}
