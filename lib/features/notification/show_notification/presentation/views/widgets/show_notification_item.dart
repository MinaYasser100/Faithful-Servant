import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/model/notification_model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../func/delete_backgound.dart';

class ShowNotificationItem extends StatelessWidget {
  const ShowNotificationItem({
    super.key,
    required this.notificationModel,
    this.deleteOnTap,
    this.itemOnTap,
  });
  final NotificationModel notificationModel;
  final void Function()? deleteOnTap;
  final void Function()? itemOnTap;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(notificationModel.key!),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        deleteOnTap;
      },
      background: deleteBackground(),
      child: GestureDetector(
        onTap: itemOnTap,
        child: ListTile(
          iconColor: kPrimaryColor,
          leading: Icon(notificationModel.readed == true
              ? Icons.notifications_none_outlined
              : Icons.notifications_active),
          contentPadding: EdgeInsets.zero,
          title: Text(
            notificationModel.title!,
            style: Styles.textStyle20PrimaryColor
                .copyWith(fontWeight: FontWeight.normal),
          ),
          subtitle: Text(
            notificationModel.body!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: deleteOnTap,
                  child: const Icon(
                    Icons.delete_rounded,
                  ),
                ),
              ),
              Text(
                _getTime(notificationModel.receivedAt!),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

String _getTime(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  String formattedTime = DateFormat('hh:mm a').format(dateTime); // 05:08 AM

  return formattedTime;
}
