import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/model/notification_model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<dynamic> customShowNotificationBottomSheet(
    {required BuildContext context,
    required NotificationModel notificationModel}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notificationModel.title!,
              style: Styles.textStyle20PrimaryColor.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              notificationModel.body!,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            notificationDetail(
              icon: Icons.access_time,
              text: _getTime(notificationModel.receivedAt!),
            ),
            const SizedBox(height: 10),
            notificationDetail(
              icon: Icons.date_range_outlined,
              text: _getDate(notificationModel.receivedAt!),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}

Row notificationDetail({required IconData icon, required String text}) {
  return Row(
    children: [
      Icon(icon, color: Colors.grey, size: 16),
      const SizedBox(width: 5),
      Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
    ],
  );
}

String _getTime(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  String formattedTime =
      DateFormat('hh:mm a').format(dateTime); // e.g. 01:30 PM

  return formattedTime;
}

String _getDate(String dateTimeString) {
  String datePart = dateTimeString.split(' ')[0];
  return datePart;
}
