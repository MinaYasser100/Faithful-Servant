import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/Drawer/drawer.dart';
import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/features/servant/presentation/views/widgets/servant_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServantView extends StatelessWidget {
  const ServantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: GeneralAppBar(
          title: 'Servant'.tr, appBar: AppBar(), widgets: const []),
      body: const ServantViewBody(),
      drawer: const GeneralDrawer(),
    );
  }
}
