import 'package:faithful_servant/core/function/validator/email_validator.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/features/forgotten_password/presentation/manager/cubit/forgotten_password_cubit.dart';
import 'package:faithful_servant/core/function/show_dialog/successfully_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

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
                  'The message is sended to this email to change password'.tr,
              titleText: 'Successfully'.tr,
              buttonText: 'Go To Login'.tr,
              onPressed: () {
                Get.offNamed(GetPages.kLoginView);
              });
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
              Text(
                "Mail Adrress Here".tr,
                style: Styles.textStyle30,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Enter your eamil address here to can change your password'.tr,
                style: Styles.textStyle16.copyWith(color: kDarkSecondColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFromField(
                labelText: 'email'.tr,
                textEditingController: emailController,
                validator: emailValidator,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextButton(
                textButton: "Change Password".tr,
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
