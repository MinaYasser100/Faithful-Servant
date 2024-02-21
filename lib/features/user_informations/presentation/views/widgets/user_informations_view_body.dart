import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:faithful_servant/features/user_informations/presentation/views/widgets/image_for_user_informations.dart';
import 'package:faithful_servant/features/user_informations/presentation/views/widgets/modifie_information_button.dart';
import 'package:faithful_servant/features/user_informations/presentation/views/widgets/show_user_informations.dart';
import 'package:flutter/material.dart';

class UserInformationsViewBody extends StatelessWidget {
  const UserInformationsViewBody({
    super.key,
    required this.userModel,
    required this.personal,
  });
  final UserModel userModel;
  final bool personal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageForUserInformations(userModel: userModel),
            const SizedBox(
              height: 10,
            ),
            ShowUserInformations(userModel: userModel),
            const SizedBox(
              height: 30,
            ),
            ModifieInformationButton(
              userModel: userModel,
              personal: personal,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
