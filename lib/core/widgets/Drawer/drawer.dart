import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'widgets/drawer_pages_options_future_builder.dart';
import 'widgets/user_accounts_drawer_future_builder.dart';

class GeneralDrawer extends StatelessWidget {
  const GeneralDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginCubitLogoutThisAccount) {}
        },
        builder: (context, state) {
          return Drawer(
            backgroundColor: Colors.white,
            child: Column(
              children: [
                const UserAccountDrawerHeaderFutureBuilder(),
                const DrawerPagesOptionsFutureBuilder(),
                ListTile(
                  onTap: () {
                    Get.toNamed(GetPages.kSettingLanguageView);
                  },
                  title: Text('Change Language'.tr),
                  trailing: const Icon(Icons.language),
                ),
                ListTile(
                  onTap: () {
                    BlocProvider.of<LoginCubit>(context).logoutMethod(context);
                  },
                  title: const Text('Log out'),
                  trailing: const Icon(Icons.logout),
                ),
                ListTile(
                  onTap: () {
                    BlocProvider.of<LoginCubit>(context).logoutMethod(context);
                  },
                  title: Text('Delete email'.tr),
                  trailing: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
