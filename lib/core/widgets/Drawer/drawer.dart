import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/widgets/Drawer/widgets/drawer_pages_options.dart';
import 'package:faithful_servant/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class GeneralDrawer extends StatelessWidget {
  final int privilege;
  const GeneralDrawer({super.key, required this.privilege});

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
                const UserAccountsDrawerHeader(
                  accountName: Text('كيرلس عادل بقطر'),
                  accountEmail: Text('kirolosadel34@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/jesus.jpeg'),
                  ),
                  decoration: BoxDecoration(color: kPrimaryColor),
                ),
                const DrawerPagesOptions(),
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
              ],
            ),
          );
        },
      ),
    );
  }
}
