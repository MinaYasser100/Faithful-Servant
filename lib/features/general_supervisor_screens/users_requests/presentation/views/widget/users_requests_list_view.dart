import 'package:faithful_servant/features/general_supervisor_screens/users_requests/presentation/manager/user_requests_cubit/user_reuests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_request_item.dart';

class UsersRequestsListView extends StatelessWidget {
  const UsersRequestsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          BlocProvider.of<UserRequestsCubit>(context).usersRequsets.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: UserRequestItem(
          user:
              BlocProvider.of<UserRequestsCubit>(context).usersRequsets[index],
        ),
      ),
    );
  }
}
