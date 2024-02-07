import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/Drawer/drawer.dart';
import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/features/general_supervisor/presentation/views/widgets/generla_supervisor_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralSuperVisor extends StatelessWidget {
  const GeneralSuperVisor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: GeneralAppBar(
          title: 'General Supervisor'.tr,
          appBar: AppBar(),
          widgets: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications_on, size: 30),
            )
          ]),
      body: const GeneralSupervisorBody(),
      drawer: const GeneralDrawer(),
    );
  }
}
