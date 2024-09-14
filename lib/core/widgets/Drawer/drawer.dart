import 'package:faithful_servant/core/function/screen_action/custom_sanck_bar.dart';
import 'package:faithful_servant/core/widgets/Drawer/widgets/list_tile_widget.dart';
import 'package:faithful_servant/features/general_supervisor_screens/users_requests/data/user_request_repo/user_requsets_repo_impl.dart';
import 'package:faithful_servant/features/general_supervisor_screens/users_requests/presentation/manager/user_requests_cubit/user_reuests_cubit.dart';
import 'package:faithful_servant/features/login/data/login_repo/login_repo_implement.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              LoginCubit(LoginRepoImplement())..getUserDataFromHive(),
        ),
        BlocProvider(
          create: (context) => UserRequestsCubit(UserRequestsRepoImplement())
            ..getUserRequestsFromFirebase(),
        ),
      ],
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginCubitLogoutThisAccount) {}
          if (state is LoginCubitDeleteUserEmailSuccess) {
            customSnackBar(
              context,
              'successfully delete account'.tr,
            );
          }
          if (state is LoginCubitDeleteUserEmailFailure) {
            customSnackBar(
              context,
              'Failure delete account'.tr,
            );
          }
        },
        builder: (context, state) {
          return Drawer(
            backgroundColor: Colors.white,
            child: Column(
              children: [
                const UserAccountDrawerHeaderFutureBuilder(),
                const DrawerPagesOptionsFutureBuilder(),
                ListTileWidget(
                    userModel: BlocProvider.of<LoginCubit>(context).user),
              ],
            ),
          );
        },
      ),
    );
  }
}
