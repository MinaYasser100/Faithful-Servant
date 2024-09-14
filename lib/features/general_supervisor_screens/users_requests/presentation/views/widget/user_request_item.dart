import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/general_supervisor_screens/users_requests/presentation/manager/user_requests_cubit/user_reuests_cubit.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_button_in_item.dart';

class UserRequestItem extends StatefulWidget {
  const UserRequestItem({
    super.key,
    required this.user,
  });
  final UserModel user;

  @override
  State<UserRequestItem> createState() => _UserRequestItemState();
}

class _UserRequestItemState extends State<UserRequestItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                widget.user.name,
                style: Styles.textStyle18.copyWith(color: kSecondColor),
              ),
            ),
            CustomButtonInItem(
              onPressed: () {
                BlocProvider.of<UserRequestsCubit>(context)
                    .activeUser(userModel: widget.user);
                BlocProvider.of<UserRequestsCubit>(context).usersRequsets = [];
                BlocProvider.of<UserRequestsCubit>(context)
                    .getUserRequestsFromFirebase();
              },
            ),
          ],
        ),
      ),
    );
  }
}
