import 'package:faithful_servant/core/function/validator/address_of_area_validator.dart';
import 'package:faithful_servant/core/function/validator/birth_date_vaildate.dart';
import 'package:faithful_servant/core/function/validator/educational_qualification_validator.dart';
import 'package:faithful_servant/core/function/validator/email_validator.dart';
import 'package:faithful_servant/core/function/validator/father_of_conession_validator.dart';
import 'package:faithful_servant/core/function/validator/name_validator.dart';
import 'package:faithful_servant/core/function/validator/national_id_validator.dart';
import 'package:faithful_servant/core/function/validator/number_of_home_validator.dart';
import 'package:faithful_servant/core/function/validator/phone_validator.dart';
import 'package:faithful_servant/core/function/validator/street_name_validator.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ModifieInformationsControllerDate extends StatefulWidget {
  const ModifieInformationsControllerDate({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneNum1Controller,
    required this.phoneNum2Controller,
    required this.birthDateController,
    required this.nationalIDController,
    required this.numberOfHomeController,
    required this.streetNameController,
    required this.addressOfAreaController,
    required this.qualificationController,
    required this.fatherOfConfessionController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneNum1Controller;
  final TextEditingController phoneNum2Controller;
  final TextEditingController birthDateController;
  final TextEditingController nationalIDController;
  final TextEditingController numberOfHomeController;
  final TextEditingController streetNameController;
  final TextEditingController addressOfAreaController;
  final TextEditingController qualificationController;
  final TextEditingController fatherOfConfessionController;

  @override
  State<ModifieInformationsControllerDate> createState() =>
      _ModifieInformationsControllerDateState();
}

class _ModifieInformationsControllerDateState
    extends State<ModifieInformationsControllerDate> {
  DateTime? selectedDate;
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
          readOnly: true,
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
          validator: phoneValidator,
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 15),
        CustomTextFromField(
          textEditingController: widget.birthDateController,
          labelText: 'Birth date'.tr,
          keyboardType: TextInputType.datetime,
          validator: birthDateVaildate,
          iconData: Icons.date_range_outlined,
          suffixOnPressed: () {
            selectDate(
              context,
              selectedDate: selectedDate,
              birthDateController: widget.birthDateController,
            );
          },
          readOnly: true,
          onTap: () {
            selectDate(
              context,
              selectedDate: selectedDate,
              birthDateController: widget.birthDateController,
            );
          },
        ),
        const SizedBox(height: 15),
        CustomTextFromField(
          textEditingController: widget.nationalIDController,
          labelText: 'National ID'.tr,
          keyboardType: TextInputType.number,
          validator: nationalIdValidator,
        ),
        const SizedBox(height: 15),
        CustomTextFromField(
          textEditingController: widget.numberOfHomeController,
          labelText: 'Number of home'.tr,
          validator: numberOfHomeValidator,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 15),
        CustomTextFromField(
          textEditingController: widget.streetNameController,
          labelText: 'Street name'.tr,
          validator: streetNameValidator,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 15),
        CustomTextFromField(
          textEditingController: widget.addressOfAreaController,
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

  Future<void> selectDate(BuildContext context,
      {required DateTime? selectedDate,
      required TextEditingController birthDateController}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        birthDateController.text = selectedDate != null
            ? DateFormat('MM/dd/yyyy').format(selectedDate!)
            : '';
      });
    }
  }
}
