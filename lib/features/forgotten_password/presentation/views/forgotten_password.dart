import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/core/widgets/design_body.dart';
import 'package:faithful_servant/features/forgotten_password/data/forgotten_password_repo/forgotten_password_repo_implement.dart';
import 'package:faithful_servant/features/forgotten_password/presentation/manager/cubit/forgotten_password_cubit.dart';
import 'package:faithful_servant/features/forgotten_password/presentation/views/widgets/forgotten_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ForgottenPasswordView extends StatelessWidget {
  const ForgottenPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: GeneralAppBar(
        title: "Forgotten Password".tr,
        appBar: AppBar(),
      ),
      body: DesignBody(
        widget: BlocProvider(
          create: (context) => ForgottenPasswordCubit(
            ForgottenPasswordRepoImplement(),
          ),
          child: const ForgottenPasswordViewBody(),
        ),
      ),
    );
  }
}
