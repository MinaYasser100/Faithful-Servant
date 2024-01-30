import 'package:faithful_servant/core/function/address_validator.dart';
import 'package:faithful_servant/core/function/current_service_validator.dart';
import 'package:faithful_servant/core/function/educational_qualification_validator.dart';
import 'package:faithful_servant/core/function/email_validator.dart';
import 'package:faithful_servant/core/function/father_of_conession_validator.dart';
import 'package:faithful_servant/core/function/name_validator.dart';
import 'package:faithful_servant/core/function/national_id_validator.dart';
import 'package:faithful_servant/core/function/password_validator.dart';
import 'package:faithful_servant/core/function/phone_validator.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/core/widgets/navigation_back_button.dart';
import 'package:faithful_servant/features/register/presentation/manager/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'choose_privilage.dart';
import 'profile_imge_widget.dart';

class ReisterViewBodyContent extends StatelessWidget {
  const ReisterViewBodyContent({
    super.key,
    required this.fromKey,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.nationalIDController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.qualificationController,
    required this.addressController,
    required this.fatherOfConfessionController,
    required this.currentServiceController,
  });

  final GlobalKey<FormState> fromKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController nationalIDController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController qualificationController;
  final TextEditingController addressController;
  final TextEditingController fatherOfConfessionController;
  final TextEditingController currentServiceController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NavigationBackButton(),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Create Account',
                  style: Styles.textStyle30,
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: ProfileImageWidget(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: fromKey,
                  autovalidateMode:
                      BlocProvider.of<RegisterCubit>(context).autovalidateMode,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      CustomTextFromField(
                        textEditingController: nameController,
                        labelText: 'Name',
                        keyboardType: TextInputType.name,
                        validator: nameValidator,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: emailController,
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: phoneController,
                        labelText: 'Phone',
                        validator: phoneValidator,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: nationalIDController,
                        labelText: 'National ID',
                        keyboardType: TextInputType.number,
                        validator: nationalIdValidator,
                      ),
                      const SizedBox(height: 15),
                      const ChoosePrivilage(),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: passwordController,
                        labelText: 'Password',
                        iconData:
                            BlocProvider.of<RegisterCubit>(context).suffixIcon,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: BlocProvider.of<RegisterCubit>(context)
                            .obscurePassword,
                        suffixOnPressed: () {
                          BlocProvider.of<RegisterCubit>(context)
                              .changeShowPassword();
                        },
                        validator: passwordVaildator,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: confirmPasswordController,
                        labelText: 'Confirm Password',
                        iconData: BlocProvider.of<RegisterCubit>(context)
                            .confirmSuffixIcon,
                        suffixOnPressed: () {
                          BlocProvider.of<RegisterCubit>(context)
                              .changeShowConfirmPassword();
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: BlocProvider.of<RegisterCubit>(context)
                            .obscureConfirmPassword,
                        validator: comfirmPasswordValidator,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: addressController,
                        labelText: 'Address',
                        validator: addressValidator,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: qualificationController,
                        labelText: 'Educational qualification',
                        validator: educationalQualificationValidator,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: fatherOfConfessionController,
                        labelText: 'Father of confession',
                        validator: fatherOfConessionValidator,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: currentServiceController,
                        labelText: 'Current service in 2023/2024',
                        validator: currentServiceValidator,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 50),
                      CustomTextButton(
                        textButton: "Create Account",
                        onPressed: () {
                          if (fromKey.currentState!.validate()) {
                          } else {
                            BlocProvider.of<RegisterCubit>(context)
                                .changeAutovalidateMode();
                          }
                        },
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  String? comfirmPasswordValidator(value) {
    if (value!.isEmpty) {
      return 'Please enter the password to comfirm from it';
    }
    if (confirmPasswordController != passwordController) {
      return 'This wrong password';
    }
    return null;
  }
}
