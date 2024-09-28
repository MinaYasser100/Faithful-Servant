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
}
