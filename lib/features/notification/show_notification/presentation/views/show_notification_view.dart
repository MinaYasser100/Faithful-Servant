import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/design_body.dart';
import 'package:faithful_servant/features/notification/presentation/manager/cubit/notification_cubit.dart';
import 'package:faithful_servant/features/notification/show_notification/presentation/views/widgets/show_notification_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ShowNotificationView extends StatelessWidget {
  const ShowNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit()..showNotificationsForUser(),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          foregroundColor: kSecondColor,
          backgroundColor: kPrimaryColor,
          title: Text(
            'My Notifications'.tr,
            style: Styles.textStyle22SecondColor,
          ),
        ),
        body: const DesignBody(widget: ShowNotificationBodyView()),
      ),
    );
  }
}
