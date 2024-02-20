import 'package:faithful_servant/core/function/validator/address_of_area_validator.dart';
import 'package:faithful_servant/core/function/validator/confirm_password_validator.dart';
import 'package:faithful_servant/core/function/validator/educational_qualification_validator.dart';
import 'package:faithful_servant/core/function/validator/father_of_conession_validator.dart';
import 'package:faithful_servant/core/function/validator/national_id_validator.dart';
import 'package:faithful_servant/core/function/validator/number_of_home_validator.dart';
import 'package:faithful_servant/core/function/validator/password_validator.dart';
import 'package:faithful_servant/core/function/validator/street_name_validator.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/features/register/presentation/manager/cubit/register_cubit.dart';
import 'package:faithful_servant/features/register/presentation/views/widgets/register_view_body_constent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SectionTwoInRegister extends StatelessWidget {
  const SectionTwoInRegister({
    super.key,
    required this.widget,
  });

  final ReisterViewBodyContent widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFromField(
          textEditingController: widget.nationalIDController,
          labelText: 'National ID'.tr,
          keyboardType: TextInputType.number,
          validator: nationalIdValidator,
        ),
        const SizedBox(height: 15),
        CustomTextFromField(
          textEditingController: widget.passwordController,
          labelText: 'password'.tr,
          iconData: BlocProvider.of<RegisterCubit>(context).suffixIcon,
          keyboardType: TextInputType.visiblePassword,
          obscureText: BlocProvider.of<RegisterCubit>(context).obscurePassword,
          suffixOnPressed: () {
            BlocProvider.of<RegisterCubit>(context).changeShowPassword();
          },
          validator: passwordVaildator,
        ),
        const SizedBox(height: 15),
        CustomTextFromField(
          textEditingController: widget.confirmPasswordController,
          labelText: 'Confirm Password'.tr,
          iconData: BlocProvider.of<RegisterCubit>(context).confirmSuffixIcon,
          suffixOnPressed: () {
            BlocProvider.of<RegisterCubit>(context).changeShowConfirmPassword();
          },
          keyboardType: TextInputType.visiblePassword,
          obscureText:
              BlocProvider.of<RegisterCubit>(context).obscureConfirmPassword,
          validator: (value) =>
              confirmPasswordValidator(value, widget.passwordController.text),
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
}
