import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/widgets/Drawer/widgets/custom_requests_icon.dart';
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
          ListTile(
            onTap: () {
              Get.toNamed(GetPages.kUserRequestsView);
            },
            title: Text('Requests'.tr),
            trailing: const CustomRequestsIcon(),
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
          title: const Text('Log out'),
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
