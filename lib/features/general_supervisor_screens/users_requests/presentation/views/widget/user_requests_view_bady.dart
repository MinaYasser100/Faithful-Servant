import 'package:faithful_servant/core/helper/styles.dart';
import 'package:flutter/material.dart';

class UserRequestsViewBady extends StatelessWidget {
  const UserRequestsViewBady({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'User Requests',
          style: Styles.textStyle30,
        )
      ],
    );
  }
}
