import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/design_body.dart';
import 'package:faithful_servant/features/all_servants/servant_details/presentation/views/widgets/servant_details_body_view.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServantDetailsView extends StatelessWidget {
  const ServantDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel userModel = Get.arguments as UserModel;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: kSecondColor,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(userModel.image),
        ),
        title: Text(
          userModel.name,
          style: Styles.textStyle22SecondColor,
        ),
      ),
      body: const DesignBody(widget: ServantDetailsBodyView()),
    );
  }
}
