import 'package:faithful_servant/core/function/validator/address_of_area_validator.dart';
import 'package:faithful_servant/core/function/validator/educational_qualification_validator.dart';
import 'package:faithful_servant/core/function/validator/father_of_conession_validator.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/widgets/addMa5domeen_widgets/add_ma5domeen_viewBody_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Section2ma5domeen extends StatelessWidget {
  const Section2ma5domeen({
    super.key,
    required this.widget,
  });

  final Addma5domeenviewbodyContent widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        CustomTextFromField(
          textEditingController: widget.addressController,
          labelText: 'Address of area'.tr,
          validator: addressOfAreaValidator,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 15),
        CustomTextFromField(
          textEditingController: widget.qualificationController,
          labelText: 'Educational qualification'.tr,
          validator: educationalQualificationValidator,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 15),
        CustomTextFromField(
          textEditingController: widget.fatherOfConfessionController,
          labelText: 'Father of confession'.tr,
          validator: fatherOfConessionValidator,
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}
