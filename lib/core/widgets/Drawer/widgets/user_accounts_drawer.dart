import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';

class UserAccountsDrawer extends StatelessWidget {
  const UserAccountsDrawer({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(userModel.name),
      accountEmail: Text(userModel.email),
      currentAccountPicture: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(userModel.image),
      ),
      decoration: const BoxDecoration(color: kPrimaryColor),
    );
  }
}
