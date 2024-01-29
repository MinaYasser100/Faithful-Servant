import 'package:faithful_servant/core/function/email_validator.dart';
import 'package:faithful_servant/core/function/name_validator.dart';
import 'package:faithful_servant/core/function/national_id_validator.dart';
import 'package:faithful_servant/core/function/password_validator.dart';
import 'package:faithful_servant/core/function/phone_validator.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/core/widgets/navigation_back_button.dart';
import 'package:flutter/material.dart';

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
  });

  final GlobalKey<FormState> fromKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController nationalIDController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBackButton(),
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
                    iconData: Icons.visibility_off_outlined,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    suffixOnPressed: () {},
                    validator: passwordVaildator,
                  ),
                  const SizedBox(height: 15),
                  CustomTextFromField(
                    textEditingController: confirmPasswordController,
                    labelText: 'Confirm Password',
                    iconData: Icons.visibility_off_outlined,
                    suffixOnPressed: () {},
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: comfirmPasswordValidator,
                  ),
                  const SizedBox(height: 50),
                  CustomTextButton(
                    textButton: "Create Account",
                    onPressed: () {
                      if (fromKey.currentState!.validate()) {}
                    },
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          )
        ],
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
