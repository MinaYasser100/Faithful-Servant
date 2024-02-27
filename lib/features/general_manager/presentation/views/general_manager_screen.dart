import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/core/widgets/Drawer/drawer.dart';
import 'package:faithful_servant/features/general_manager/presentation/views/widgets/general_manager_body.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralManager extends StatefulWidget {
  const GeneralManager({super.key});

  @override
  State<GeneralManager> createState() => _GeneralManagerState();
}

class _GeneralManagerState extends State<GeneralManager> {
  UserModel userModel = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: const GeneralManagerBody(),
      appBar: GeneralAppBar(
        title: userModel.role,
        appBar: AppBar(),
        widgets: [
          IconButton(
              onPressed: () {
                Get.toNamed(GetPages.notification);
              },
              icon: const Icon(Icons.notifications_on, size: 30.0)),
          IconButton(
            onPressed: () {
              Get.toNamed(GetPages.personalview);
            },
            icon: const Icon(Icons.person_pin, size: 30.0),
          ),
        ],
      ),
      drawer: const GeneralDrawer(),
    );
  }
}
