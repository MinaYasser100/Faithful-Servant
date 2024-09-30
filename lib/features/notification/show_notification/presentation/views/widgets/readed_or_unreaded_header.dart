import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/model/notification_model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadedOrUnreadedHeader extends StatelessWidget {
  const ReadedOrUnreadedHeader({
    super.key,
    required this.allNotifications,
    required this.numberOfUnReadedNotification,
  });
  final List<NotificationModel> allNotifications;
  final int numberOfUnReadedNotification;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${'readed'.tr} : ${allNotifications.length - numberOfUnReadedNotification} ',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.normal),
        ),
        Text(
          '${"unreaded".tr} : $numberOfUnReadedNotification ',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
