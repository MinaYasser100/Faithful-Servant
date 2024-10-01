import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/notification/data/notification_helper.dart';
import 'package:faithful_servant/features/notification/presentation/manager/cubit/notification_cubit.dart';
import 'package:faithful_servant/features/notification/show_notification/presentation/views/func/custom_notification_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'readed_or_unreaded_header.dart';
import 'show_notification_item.dart';

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
                const Divider(color: kPrimaryColor),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: state.allNotifications.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) => ShowNotificationItem(
                      notificationModel: state.allNotifications[index],
                      deleteOnTap: () {
                        NotificationHelper()
                            .deleteNotification(state.allNotifications[index]);
                        context
                            .read<NotificationCubit>()
                            .showNotificationsForUser();
                      },
                      itemOnTap: () {
                        customShowNotificationBottomSheet(
                          context: context,
                          notificationModel: state.allNotifications[index],
                        );
                        NotificationHelper().makeNotificationAsReaded(
                            state.allNotifications[index]);
                        context
                            .read<NotificationCubit>()
                            .showNotificationsForUser();
                      },
                    ),
                  ),
                )
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
