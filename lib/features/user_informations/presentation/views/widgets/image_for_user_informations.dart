import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';

class ImageForUserInformations extends StatelessWidget {
  const ImageForUserInformations({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 86,
        backgroundColor: kPrimaryLightColor,
        child: CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(userModel.image),
        ),
      ),
    );
  }
}
