import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';

import 'custom_button_in_item.dart';

class UserRequestItem extends StatelessWidget {
  const UserRequestItem({
    super.key,
    required this.user,
  });
  final UserModel user;
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
          children: [
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  user.name,
                  style: Styles.textStyle18.copyWith(color: kSecondColor),
                ),
              ),
            ),
            const CustomButtonInItem(),
          ],
        ),
      ),
    );
  }
}
