import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/core/widgets/Drawer/drawer.dart';
import 'package:faithful_servant/features/general_manager/presentation/views/widgets/general_manager_body.dart';
import 'package:flutter/material.dart';

class GeneralManager extends StatelessWidget {
  const GeneralManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: const GeneralManagerBody(),
      appBar: GeneralAppBar(
        title: 'امين الخدمة',
        appBar: AppBar(),
        widgets: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications_on, size: 30),
          )
        ],
      ),
      drawer: const GeneralDrawer(privilege: 2),
    );
  }
}
