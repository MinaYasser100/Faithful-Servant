import 'package:flutter/material.dart';

import 'user_request_item.dart';

class UserRequestsViewBady extends StatelessWidget {
  const UserRequestsViewBady({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [UserRequestItem()],
    );
  }
}
