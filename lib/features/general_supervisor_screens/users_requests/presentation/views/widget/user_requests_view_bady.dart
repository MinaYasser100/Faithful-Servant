import 'package:flutter/material.dart';

import 'users_requests_list_view.dart';

class UserRequestsViewBady extends StatelessWidget {
  const UserRequestsViewBady({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: UsersRequestsListView(),
        ),
      ],
    );
  }
}
