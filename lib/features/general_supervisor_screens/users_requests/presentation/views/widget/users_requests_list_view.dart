import 'package:flutter/material.dart';

import 'user_request_item.dart';

class UsersRequestsListView extends StatelessWidget {
  const UsersRequestsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: UserRequestItem(),
      ),
    );
  }
}
