import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/features/notification/data/notification_helper.dart';
import 'package:faithful_servant/features/notification/presentation/manager/cubit/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'custom_natification_text_form_field.dart';

class NotificationBody extends StatefulWidget {
  const NotificationBody({super.key});

  @override
  State<NotificationBody> createState() => _NotificationBodyState();
}

class _NotificationBodyState extends State<NotificationBody> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  GlobalKey<FormState> notificationKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: notificationKey,
          autovalidateMode: context.read<NotificationCubit>().autovalidateMode,
          child: Column(
            children: [
              CustomNatificationTextFormField(
                controller: titleController,
                labelText: 'Title'.tr,
                maxLines: 1,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'please enter the title of the notification'.tr;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomNatificationTextFormField(
                controller: contentController,
                maxLines: 2,
                labelText: 'Content'.tr,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'please enter the content of the notification'.tr;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextButton(
                textButton: 'Send'.tr,
                onPressed: () {
                  if (notificationKey.currentState!.validate()) {
                    NotificationHelper().sendNotification(
                      title: titleController.text,
                      body: contentController.text,
                    );
                  } else {
                    context.read<NotificationCubit>().changeAutovalidateMode();
                  }
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
