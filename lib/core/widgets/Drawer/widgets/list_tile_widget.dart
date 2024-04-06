import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/widgets/Drawer/widgets/custom_requests_icon.dart';
import 'package:faithful_servant/features/general_supervisor_screens/users_requests/presentation/manager/user_requests_cubit/user_reuests_cubit.dart';
import 'package:faithful_servant/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.userModel,
  });
  final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (userModel?.privilage == 'المشرف العام')
          BlocBuilder<UserRequestsCubit, UserRequestsState>(
            builder: (context, state) {
              return ListTile(
                onTap: () {
                  Get.toNamed(GetPages.kUserRequestsView);
                },
                title: Text('Requests'.tr),
                trailing: CustomRequestsIcon(
                  numberOfUsers: BlocProvider.of<UserRequestsCubit>(context)
                      .usersRequsets
                      .length
                      .toString(),
                ),
              );
            },
          ),
        ListTile(
          onTap: () {
            Get.toNamed(GetPages.kSettingLanguageView);
          },
          title: Text('Change Language'.tr),
          trailing: const Icon(Icons.language),
        ),
        ListTile(
          onTap: () {
            BlocProvider.of<LoginCubit>(context).logoutMethod();
          },
          title: Text('Log out'.tr),
          trailing: const Icon(Icons.logout),
        ),
        ListTile(
          onTap: () {
            BlocProvider.of<LoginCubit>(context).deleteUserEmail();
          },
          title: Text('Delete account'.tr),
          trailing: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
