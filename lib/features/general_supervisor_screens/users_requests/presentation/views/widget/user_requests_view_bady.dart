import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/general_supervisor_screens/users_requests/presentation/manager/user_requests_cubit/user_reuests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'users_requests_list_view.dart';

class UserRequestsViewBady extends StatelessWidget {
  const UserRequestsViewBady({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserRequestsCubit, UserRequestsState>(
      builder: (context, state) {
        if (state is UserRequestsGetUsersRequestsFromFirebaseFailure) {
          return Center(
            child: Text(
              'Failure when get the requests'.tr,
              style: Styles.textStyle20PrimaryColor,
            ),
          );
        } else if (state is UserRequestsGetUsersRequestsFromFirebaseSuccess ||
            state is UserRequestsActiveUserSuccess) {
          return Column(
            children: [
              Expanded(
                child:
                    context.read<UserRequestsCubit>().usersRequsets.isNotEmpty
                        ? const UsersRequestsListView()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'There are no requests now'.tr,
                                style: Styles.textStyle18
                                    .copyWith(color: kPrimaryColor),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
