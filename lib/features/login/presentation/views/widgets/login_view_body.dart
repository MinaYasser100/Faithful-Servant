import 'package:faithful_servant/core/function/email_validator.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> fromkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return LoginViewBodyContent(
      emailController: emailController,
      passwordController: passwordController,
      fromkey: fromkey,
    );
  }
}

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
          const Text(
            'Welcome Back',
            style: Styles.textStyle30,
          ).animate().then().shake(),
          const SizedBox(height: 70),
          Text(
            'Enter your eamil & password',
            style: Styles.textStyle16.copyWith(
              color: kSecondColor,
            ),
          ),
          const SizedBox(
            height: 15,
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
              'Forgetten Password',
              style: TextStyle(
                color: kSecondColor,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: kSecondColor,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Create New Acount',
                  style: Styles.textStyle16,
                ),
              ),
              const Icon(
                Icons.arrow_back_ios_outlined,
                color: kSecondColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
