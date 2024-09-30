part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationChangeAutovalidateMode extends NotificationState {}

final class NotificationCubitShowNotificationSuceess extends NotificationState {
  final List<NotificationModel> allNotifications;
  final int numberOfUnReadedNotification;

  NotificationCubitShowNotificationSuceess({
    required this.allNotifications,
    required this.numberOfUnReadedNotification,
  });
}

final class NotificationCubitShowNotificationLoading
    extends NotificationState {}

final class NotificationCubitShowNotificationFailure
    extends NotificationState {}
