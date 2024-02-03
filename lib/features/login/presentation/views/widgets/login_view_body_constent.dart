import 'package:faithful_servant/core/function/email_validator.dart';
import 'package:faithful_servant/core/helper/cache_helper.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/core/widgets/navigation_back_button.dart';
import 'package:faithful_servant/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
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
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginCubitLoginUserLoading) {
          EasyLoading.show(
            status: 'Loading...',
          );
        }
        if (state is LoginCubitLoginUserSuccess) {
          EasyLoading.dismiss();
          Navigator.pushNamedAndRemoveUntil(
            context,
            GetPages.generalManager,
            (route) => false,
          );
          BlocProvider.of<LoginCubit>(context)
              .findUserInformationWhenLogin(userID: state.userId);
          await CacheHelper.saveData(key: kUserId, value: state.userId);
          userToken = state.userId;
        }
        if (state is LoginCubitLoginUserfailure) {
          EasyLoading.showError('من فضلك تاكد من معلوماتك');
          Future.delayed(const Duration(seconds: 5));
          EasyLoading.dismiss();
        }
      },
      builder: (context, state) {
        return Form(
          key: fromkey,
          autovalidateMode:
              BlocProvider.of<LoginCubit>(context).autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const NavigationBackButton(),
                const SizedBox(height: 70),
                Text(
                  'welcome back'.tr,
                  style: Styles.textStyle30,
                ).animate().then().shake(),
                const SizedBox(height: 60),
                Text(
                  'Enter your email and password'.tr,
                  style: Styles.textStyle16.copyWith(
                    color: kTextGreyColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFromField(
                  textEditingController: emailController,
                  labelText: 'email'.tr,
                  validator: emailValidator,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFromField(
                  textEditingController: passwordController,
                  labelText: "password".tr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please, enter your password'.tr;
                    }
                    return null;
                  },
                  obscureText:
                      BlocProvider.of<LoginCubit>(context).obscurePassword,
                  iconData: BlocProvider.of<LoginCubit>(context).suffixIcon,
                  keyboardType: TextInputType.visiblePassword,
                  suffixOnPressed: () {
                    BlocProvider.of<LoginCubit>(context).changeShowPassword();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextButton(
                  textButton: 'login'.tr,
                  onPressed: () {
                    if (fromkey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context).loginUser(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    } else {
                      BlocProvider.of<LoginCubit>(context)
                          .changeAutovalidateMode();
                    }
                  },
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(GetPages.kforgottenPasswordView);
                  },
                  child: Text(
                    'forgotten password'.tr,
                    style: const TextStyle(
                      fontSize: 15,
                      color: kPrimaryLightColor,
                    ),
                  ),
                ),
                const CreateNewAccountSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}
