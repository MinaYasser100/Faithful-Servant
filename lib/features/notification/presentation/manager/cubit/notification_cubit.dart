import 'package:faithful_servant/core/model/notification_model/notification_model.dart';
import 'package:faithful_servant/features/notification/data/notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void changeAutovalidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(NotificationChangeAutovalidateMode());
  }

  void showNotificationsForUser() {
    emit(NotificationCubitShowNotificationLoading());
    List<NotificationModel> allNotifications =
        NotificationHelper().getAllNotification();
    int numberOfUnReadedNotification =
        NotificationHelper().gettingnumberOfUnReadedNotification();
    allNotifications = allNotifications.reversed.toList();
    emit(NotificationCubitShowNotificationSuceess(
      allNotifications: allNotifications,
      numberOfUnReadedNotification: numberOfUnReadedNotification,
    ));
  }
}
