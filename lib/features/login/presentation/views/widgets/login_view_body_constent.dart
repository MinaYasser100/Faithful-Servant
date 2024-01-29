import 'package:faithful_servant/core/function/email_validator.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/core/widgets/navigation_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'create_new_account_section.dart';

class LoginViewBodyContent extends StatelessWidget {
  const LoginViewBodyContent({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.fromkey,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> fromkey;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const NavigationBackButton(),
          const SizedBox(height: 70),
          const Text(
            'Welcome Back',
            style: Styles.textStyle30,
          ).animate().then().shake(),
          const SizedBox(height: 60),
          Text(
            'Enter your eamil & password',
            style: Styles.textStyle16.copyWith(
              color: kTextGreyColor,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFromField(
            textEditingController: emailController,
            labelText: 'Email',
            validator: emailValidator,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFromField(
            textEditingController: passwordController,
            labelText: "Password",
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            obscureText: true,
            iconData: Icons.visibility_off_outlined,
            keyboardType: TextInputType.visiblePassword,
            suffixOnPressed: () {},
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextButton(
            textButton: 'LOGIN',
            onPressed: () {},
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Forgotten Password',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const CreateNewAccountSection(),
        ],
      ),
    );
  }
}
