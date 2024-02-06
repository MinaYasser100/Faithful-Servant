import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';

import 'drawer_pages_options.dart';

class DrawerPagesOptionsFutureBuilder extends StatelessWidget {
  const DrawerPagesOptionsFutureBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Text('No user data found.');
        } else {
          UserModel userModel = snapshot.data!;
          return DrawerPagesOptions(userModel: userModel);
        }
      },
    );
  }
}
