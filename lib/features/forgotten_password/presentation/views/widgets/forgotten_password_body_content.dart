import 'package:faithful_servant/core/function/email_validator.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';

class ForgottenPasswordBodyContent extends StatelessWidget {
  const ForgottenPasswordBodyContent({
    super.key,
    required this.emailController,
    required this.formKey,
  });

  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const Text(
            "Mail Adrress Here",
            style: Styles.textStyle30,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Enter your eamil address here to can change your password',
            style: Styles.textStyle16.copyWith(color: kDarkSecondColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFromField(
            labelText: 'Email',
            textEditingController: emailController,
            validator: emailValidator,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextButton(
            textButton: "Recover Password",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
