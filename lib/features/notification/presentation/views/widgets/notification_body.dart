import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/features/notification/data/notification_helper.dart';
import 'package:faithful_servant/features/notification/presentation/manager/cubit/notification_cubit.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:faithful_servant/features/register/presentation/views/widgets/choose_form_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:googleapis/appengine/v1.dart';

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

  Future<UserModel?> getUserModel() async {
    return await getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: getUserModel(), // Fetch user model
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final userModel = snapshot.data;
        var cubit = context.read<NotificationCubit>();
        return BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: notificationKey,
                autovalidateMode:
                    context.read<NotificationCubit>().autovalidateMode,
                child: Column(
                  children: [
                    CustomNatificationTextFormField(
                      controller: titleController,
                      labelText: 'Title'.tr,
                      maxLines: 1,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'please enter the title of the notification'
                              .tr;
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
                          return 'please enter the content of the notification'
                              .tr;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (userModel!.privilage == 'المشرف العام')
                      ChooseFromItems(
                        items: userTopics.keys.toList(),
                        selectedItem: cubit.selectedItem,
                        onChanged: (newValue) {
                          cubit.changeSelectedItem(newValue!);
                        },
                      ),
                    if (userModel.privilage == 'امين قطاع' &&
                        userModel.currentService == 'اعدادي و ثانوي')
                      ChooseFromItems(
                        items: firstList,
                        selectedItem: cubit.selectedItem2,
                        onChanged: (newValue) {
                          cubit.changeSelectedItem2(newValue!);
                        },
                      ),
                    if (userModel.privilage == 'امين قطاع' &&
                        userModel.currentService == 'خدام و اعداد خدام')
                      ChooseFromItems(
                        items: secondList,
                        selectedItem: cubit.selectedItem3,
                        onChanged: (newValue) {
                          cubit.changeSelectedItem3(newValue!);
                        },
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextButton(
                      textButton: 'Send'.tr,
                      onPressed: () async {
                        if (notificationKey.currentState!.validate()) {
                          try {
                            EasyLoading.show(status: 'Sending...'.tr);
                            await NotificationHelper().sendNotification(
                              title: titleController.text,
                              body: contentController.text,
                              topic: userModel.privilage == 'المشرف العام'
                                  ? cubit.selectedItem
                                  : (userModel.privilage == 'امين قطاع' &&
                                          userModel.currentService ==
                                              'اعدادي و ثانوي')
                                      ? cubit.selectedItem2
                                      : (userModel.privilage == 'امين قطاع' &&
                                              userModel.currentService ==
                                                  'خدام و اعداد خدام')
                                          ? cubit.selectedItem3
                                          : userModel.currentService,
                            );
                            EasyLoading.showSuccess('Notification Sent'.tr);
                            titleController.clear();
                            contentController.clear();
                          } on Exception catch (e) {
                            ErrorHandler(errorCode: e.toString());
                          }
                        } else {
                          context
                              .read<NotificationCubit>()
                              .changeAutovalidateMode();
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

List<String> firstList = [
  'اعدادي و ثانوي',
  'أعدادي',
  'ثانوي',
];

List<String> secondList = [
  'خدام و اعداد خدام',
  'اجتماع الخدام',
  'اعداد خدام',
];
