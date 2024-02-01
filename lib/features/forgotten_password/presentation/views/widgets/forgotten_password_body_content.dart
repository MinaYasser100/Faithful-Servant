import 'package:faithful_servant/core/function/email_validator.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/features/forgotten_password/presentation/manager/cubit/forgotten_password_cubit.dart';
import 'package:faithful_servant/features/register/presentation/views/function/successfully_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocConsumer<ForgottenPasswordCubit, ForgottenPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordCheckUserEmailSuccess) {
          successfullyShowDialog(
            context: context,
            contentText:
                'سوف يرسل لك رسالة علي هذا الايميل تستطيع من خلالها ان تغيير كلمة المرور',
            titleText: 'Successfully',
            buttonText: 'Go To Login',
          );
          emailController.clear();
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode:
              BlocProvider.of<ForgottenPasswordCubit>(context).autovalidateMode,
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<ForgottenPasswordCubit>(context)
                        .changePassword(email: emailController.text);
                    Future.delayed(const Duration(milliseconds: 100));
                  } else {
                    BlocProvider.of<ForgottenPasswordCubit>(context)
                        .changeAuotvalidateMode();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
