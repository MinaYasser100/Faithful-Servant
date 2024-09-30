import 'package:faithful_servant/features/notification/presentation/manager/cubit/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'readed_or_unreaded_header.dart';

class ShowNotificationBodyView extends StatelessWidget {
  const ShowNotificationBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is NotificationCubitShowNotificationLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NotificationCubitShowNotificationSuceess) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ReadedOrUnreadedHeader(
                  allNotifications: state.allNotifications,
                  numberOfUnReadedNotification:
                      state.numberOfUnReadedNotification,
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Text('Error when loading data'.tr),
          );
        }
      },
    );
  }
}
