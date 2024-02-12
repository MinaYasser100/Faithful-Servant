import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/core/widgets/design_body.dart';
import 'package:faithful_servant/features/modifie_informations/presentation/views/widgets/modifie_informations_view_body.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModifieInformationsView extends StatelessWidget {
  final UserModel userModel;
  ModifieInformationsView({super.key}) : userModel = Get.arguments as UserModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: GeneralAppBar(
        title: 'Editing Informations'.tr,
        appBar: AppBar(),
      ),
      body: DesignBody(
        widget: ModifieInformationsViewBody(
          userModel: userModel,
        ),
      ),
    );
  }
}
