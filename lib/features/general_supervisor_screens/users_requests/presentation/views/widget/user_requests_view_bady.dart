import 'package:faithful_servant/features/general_supervisor_screens/users_requests/presentation/manager/user_requests_cubit/user_reuests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'users_requests_list_view.dart';

class UserRequestsViewBady extends StatelessWidget {
  const UserRequestsViewBady({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserReuestsCubit, UserReuestsState>(
      builder: (context, state) {
        if (state is UserReuestsGetUsersRequestsFromFirebaseFailure) {
          return const Text('No requests');
        } else if (state is UserReuestsGetUsersRequestsFromFirebaseSuccess) {
          return Column(
            children: [
              const Expanded(
                child: UsersRequestsListView(),
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<UserReuestsCubit>(context)
                      .getUserRequestsFromFirebase();
                },
                child: const Text('Button'),
              ),
            ],
          );
        } else {
          return const Expanded(
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
