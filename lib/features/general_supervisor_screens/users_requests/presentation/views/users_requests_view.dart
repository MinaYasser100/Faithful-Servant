import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/core/widgets/design_body.dart';
import 'package:faithful_servant/features/general_supervisor_screens/users_requests/presentation/views/widget/user_requests_view_bady.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersRequestsView extends StatelessWidget {
  const UsersRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: GeneralAppBar(title: 'Users Requests'.tr, appBar: AppBar()),
      body: const DesignBody(
          widget: Padding(
        padding: EdgeInsets.all(20.0),
        child: UserRequestsViewBady(),
      )),
    );
  }
}
