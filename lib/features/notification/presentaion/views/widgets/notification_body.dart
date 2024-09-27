import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: notificationKey,
        child: Column(
          children: [
            CustomNatificationTextFormField(
              controller: titleController,
              labelText: 'Title'.tr,
              maxLines: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomNatificationTextFormField(
              controller: contentController,
              maxLines: 2,
              labelText: 'Content'.tr,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextButton(
              textButton: 'Send'.tr,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
