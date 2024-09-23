import 'package:faithful_servant/core/function/validator/name_validator.dart';
import 'package:faithful_servant/core/function/validator/phone_validator.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/widgets/addMa5domeen_widgets/add_ma5domeen_view_body_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Section1addma5domeen extends StatelessWidget {
  const Section1addma5domeen({
    super.key,
    required this.widget,
  });

  final Addma5domeenviewbodyContent widget;

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
          textEditingController: widget.phoneNumber1Controller,
          labelText: 'Phone number 1'.tr,
          validator: phoneValidator,
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 15),
        CustomTextFromField(
          textEditingController: widget.phoneNumber2Controller,
          labelText: 'Phone number 2'.tr,
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }
}
