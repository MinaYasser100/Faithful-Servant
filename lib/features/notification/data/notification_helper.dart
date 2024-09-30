import 'package:dio/dio.dart';
import 'package:faithful_servant/core/helper/constant.dart';

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
}
