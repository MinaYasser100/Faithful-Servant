import 'package:faithful_servant/core/function/get_first_three_words.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/design_body.dart';
import 'package:faithful_servant/features/general_supervisor_screens/users_requests/user_request_details/presentation/views/widgets/user_request_details_body_view.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRequestDetailsView extends StatelessWidget {
  const UserRequestDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel? userModel = Get.arguments;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: kSecondColor,
        title: Text(getFirstThreeWords(userModel!.name)),
        titleSpacing: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: CircleAvatar(
              radius: 23,
              backgroundImage: NetworkImage(userModel.image),
            ),
          )
        ],
      ),
      body: DesignBody(
        widget: UserRequestDetailsBodyView(
          userModel: userModel,
        ),
      ),
    );
  }
}
