import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/design_body.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/search/presentation/views/widgets/ma5domeen_search_body_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ma5domeenSearchView extends StatelessWidget {
  const Ma5domeenSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final String stateName = Get.arguments as String;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: kSecondColor,
        titleSpacing: 0,
        title: Text('Ma5domeen Search'.tr),
        centerTitle: true,
      ),
      body: DesignBody(
          widget: Ma5domeenSearchBodyView(
        stateName: stateName,
      )),
    );
  }
}
