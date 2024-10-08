import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/widgets/Drawer/drawer.dart';
import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/features/feudal_custodian/feual_custodian_view/presentaion/views/widgets/feudal_custodian_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeudalCustodianView extends StatelessWidget {
  const FeudalCustodianView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: GeneralAppBar(
        title: 'Feudal custodian'.tr,
        appBar: AppBar(),
        widgets: [
          IconButton(
            onPressed: () {
              Get.toNamed(GetPages.notification);
            },
            icon: const Icon(Icons.notifications_on, size: 30.0),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(GetPages.personalview);
            },
            icon: const Icon(Icons.person_pin, size: 30.0),
          ),
        ],
      ),
      drawer: const GeneralDrawer(),
      body: const FeudalCustodianViewBody(),
    );
  }
}
