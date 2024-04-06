import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/general_supervisor_screens/users_requests/presentation/manager/user_requests_cubit/user_reuests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'users_requests_list_view.dart';

class UserRequestsViewBady extends StatelessWidget {
  const UserRequestsViewBady({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserRequestsCubit, UserRequestsState>(
      builder: (context, state) {
        if (state is UserRequestsGetUsersRequestsFromFirebaseFailure) {
          return const Center(
            child: Text(
              'No requests',
              style: Styles.textStyle20PrimaryColor,
            ),
          );
        } else if (state is UserRequestsGetUsersRequestsFromFirebaseSuccess ||
            state is UserRequestsActiveUserSuccess) {
          return const Column(
            children: [
              Expanded(
                child: UsersRequestsListView(),
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
