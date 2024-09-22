import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/login/confirm_validity/presentation/views/widgets/confirm_validity_body_view.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../manager/confirm_validity_cubit.dart';

class ConfirmValidityView extends StatelessWidget {
  const ConfirmValidityView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UserModel userModel = Get.arguments as UserModel;
    return BlocProvider(
      create: (context) => ConfirmValidityCubit(),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: kPrimaryColor,
          title: Text(
            'Confirm Validity'.tr,
            style: Styles.textStyle25SecondColor.copyWith(
              color: kPrimaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: ConfirmValidityBodyView(
          userModel: userModel,
        ),
      ),
    );
  }
}
