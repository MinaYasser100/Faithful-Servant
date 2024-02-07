import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/Drawer/drawer.dart';
import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/features/mine_servant/presentation/views/widgets/mine_servant_body.dart';
import 'package:flutter/material.dart';

class MineServant extends StatelessWidget {
  const MineServant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      drawer: const GeneralDrawer(),
      appBar: GeneralAppBar(
        title: 'خدام المراحل',
        appBar: AppBar(),
      ),
      body: const MineServantBody(),
    );
  }
}
