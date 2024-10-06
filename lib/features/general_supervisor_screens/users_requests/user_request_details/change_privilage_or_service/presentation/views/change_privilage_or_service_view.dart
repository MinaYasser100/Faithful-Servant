import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/design_body.dart';
import 'package:faithful_servant/features/general_supervisor_screens/users_requests/user_request_details/change_privilage_or_service/presentation/views/widgets/change_privilage_or_service_body_view.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../data/chnage_privilage_or_service_repo_impl.dart';
import '../manager/cubit/change_privilage_or_service_cubit.dart';

class ChangePrivilageOrServiceView extends StatelessWidget {
  const ChangePrivilageOrServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChangePrivilageOrServiceCubit(ChnagePrivilageOrServiceRepoImpl()),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          foregroundColor: kSecondColor,
        ),
        body: DesignBody(
          widget: ChangePrivilageOrServiceBodyView(
            userModel: Get.arguments as UserModel,
          ),
        ),
      ),
    );
  }
}
