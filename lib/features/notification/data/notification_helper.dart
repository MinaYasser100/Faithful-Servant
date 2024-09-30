import 'package:dio/dio.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/model/notification_model/notification_model.dart';
import 'package:hive/hive.dart';

import 'get_access_token.dart';

class NotificationHelper {
  final Dio _dio = Dio();
  Future<bool> sendNotification({
    required String title,
    required String body,
    required String topic,
  }) async {
    try {
      final String? serverToken = await getAccessToken();
      await _dio.post(
        'https://fcm.googleapis.com/v1/projects/faithful-servant-759bd/messages:send',
        options: Options(
          headers: <String, String>{
            'Authorization': 'Bearer $serverToken',
          },
        ),
        data: {
          "message": {
            "topic": userTopics[topic],
            "notification": {"title": title, "body": body},
            "android": {
              "notification": {
                "notification_priority": "PRIORITY_MAX",
                "sound": "default"
              }
            },
            "apns": {
              "payload": {
                "aps": {
                  "content_available": true,
                }
              },
            },
            "data": {
              "type": "type",
              "id": "userId",
              "click_action": "FLUTTER_NOTIFICATION_CLICK"
            }
          }
        },
      );
      return true;
    } on DioException {
      return false;
    }
  }

  List<NotificationModel> getAllNotification() {
    List<NotificationModel> allNotifications = [];
    for (int i = 0; i < Hive.box(kNotificationBoxKey).length; i++) {
      allNotifications.add(Hive.box(kNotificationBoxKey).getAt(i));
    }
    return allNotifications;
  }

  void addNotification(NotificationModel notification) {
    Hive.box(kNotificationBoxKey).put(notification.key, notification);
  }

  void deleteNotification(NotificationModel notification) {
    Hive.box(kNotificationBoxKey).delete(notification.key);
  }

  void makeNotificationAsReaded(NotificationModel notification) {
    if (notification.readed == false) {
      notification.readed = true;
      Hive.box(kNotificationBoxKey).put(notification.key, notification);
    }
  }

  void makeAllNotificationAsReaded() {
    for (int i = 0; i < Hive.box(kNotificationBoxKey).length; i++) {
      NotificationModel notification = Hive.box(kNotificationBoxKey).getAt(i);
      if (notification.readed == false) {
        notification.readed = true;
        Hive.box(kNotificationBoxKey).put(notification.key, notification);
      }
    }
  }

  void deleteAllNotification() {
    Hive.box(kNotificationBoxKey).clear();
  }

  void deleteAllReadedNotification() {
    for (int i = 0; i < Hive.box(kNotificationBoxKey).length; i++) {
      NotificationModel notification = Hive.box(kNotificationBoxKey).getAt(i);
      if (notification.readed == true) {
        Hive.box(kNotificationBoxKey).delete(notification.key);
      }
    }
  }

  void deleteAllUnReadedNotification() {
    for (int i = 0; i < Hive.box(kNotificationBoxKey).length; i++) {
      NotificationModel notification = Hive.box(kNotificationBoxKey).getAt(i);
      if (notification.readed == false) {
        Hive.box(kNotificationBoxKey).delete(notification.key);
      }
    }
  }

  int gettingnumberOfUnReadedNotification() {
    int numberOfUnReadedNotification = 0;
    for (int i = 0; i < Hive.box(kNotificationBoxKey).length; i++) {
      NotificationModel notification = Hive.box(kNotificationBoxKey).getAt(i);
      if (notification.readed == false) {
        numberOfUnReadedNotification++;
      }
    }
    return numberOfUnReadedNotification;
  }

  int gettingnumberOfReadedNotification() {
    int numberOfReadedNotification = 0;
    for (int i = 0; i < Hive.box(kNotificationBoxKey).length; i++) {
      NotificationModel notification = Hive.box(kNotificationBoxKey).getAt(i);
      if (notification.readed == true) {
        numberOfReadedNotification++;
      }
    }
    return numberOfReadedNotification;
  }
}
