import 'package:faithful_servant/core/function/show_dialog/failure_show_dialog.dart';
import 'package:faithful_servant/core/helper/cache_helper.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../manager/confirm_validity_cubit.dart';

class ConfirmValidityBodyView extends StatefulWidget {
  const ConfirmValidityBodyView({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<ConfirmValidityBodyView> createState() =>
      _ConfirmValidityBodyViewState();
}

class _ConfirmValidityBodyViewState extends State<ConfirmValidityBodyView> {
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> fromkey = GlobalKey<FormState>();
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmValidityCubit, ConfirmValidityState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: fromkey,
          autovalidateMode:
              context.read<ConfirmValidityCubit>().autovalidateMode,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Write the confirm word to take the supervisor general authority'
                    .tr,
                style: Styles.textStyle20PrimaryColor,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFromField(
                textEditingController: passwordController,
                labelText: "Confirm word".tr,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please, enter your password'.tr;
                  }
                  return null;
                },
                obscureText: BlocProvider.of<ConfirmValidityCubit>(context)
                    .obscurePassword,
                iconData:
                    BlocProvider.of<ConfirmValidityCubit>(context).suffixIcon,
                keyboardType: TextInputType.visiblePassword,
                suffixOnPressed: () {
                  BlocProvider.of<ConfirmValidityCubit>(context)
                      .changeShowPassword();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextButton(
                textButton: 'Confirm'.tr,
                onPressed: () async {
                  if (fromkey.currentState!.validate()) {
                    if (passwordController.text == '777101010') {
                      await CacheHelper.removeData(key: kHomeView);

                      await CacheHelper.saveData(
                          key: kUserId, value: widget.userModel.userID);
                      userToken = widget.userModel.userID;
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        GetPages.kGeneralSupervisor,
                        (route) => false,
                      );
                      await CacheHelper.saveData(
                          key: kHomeView, value: GetPages.kGeneralSupervisor);
                    } else {
                      failureShowDialog(context);
                      passwordController.clear();
                    }
                  } else {
                    BlocProvider.of<ConfirmValidityCubit>(context)
                        .changeAutovalidateMode();
                  }
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
