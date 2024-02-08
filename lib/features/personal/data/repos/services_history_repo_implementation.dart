// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/personal/data/Models/services_history_model/service_history_model.dart';
import 'package:faithful_servant/features/personal/data/repos/services_history_repos.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ServiceHistoryImplementaion implements ServicesHistoryRepo {
  @override
  Future<void> addNewServiceToHistory(
      {required ServiceHistoryModel data,
      required UserModel userModel,
      required BuildContext context}) async {
    try {
      EasyLoading.show(status: 'تحميل ...');
      await FirebaseFirestore.instance
          .collection(churchNamesBasedOnCode[userModel.church])
          .doc(userModel.church)
          .collection('history_of_servant')
          .add(data.toJson());
      EasyLoading.dismiss();
    } on Exception {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: kDarkSecondColor,
            title: Text(
              'Error',
              style: Styles.textStyle20.copyWith(color: kPrimaryColor),
            ),
            content: Text(
              'حدث خظأ اثناء جلب البيانات من السيرفر برجاء المحاولة مره اخري',
              style: Styles.textStyle16.copyWith(
                color: kSecondColor,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'خروج',
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Future editServiceInHistory(
      {required ServiceHistoryModel data,
      required UserModel userModel,
      required BuildContext context}) async {
    try {
      EasyLoading.show(status: 'تحميل ...');
      UserModel? user = await getUserData();
      if (user != null) {
        await FirebaseFirestore.instance
            .collection(churchNamesBasedOnCode[userModel.church])
            .doc(userModel.church)
            .collection('history_of_servant')
            .doc(user.userID)
            .update(data.toJson());
      }
      EasyLoading.dismiss();
    } on Exception {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: kDarkSecondColor,
            title: Text(
              'Error',
              style: Styles.textStyle20.copyWith(color: kPrimaryColor),
            ),
            content: Text(
              'حدث خظأ اثناء جلب البيانات من السيرفر برجاء المحاولة مره اخري',
              style: Styles.textStyle16.copyWith(
                color: kSecondColor,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'خروج',
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Future<dynamic> fetchhistorydata(
      {required UserModel userModel, required BuildContext context}) async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection(churchNamesBasedOnCode[userModel.church])
          .doc(userModel.church)
          .collection('history_of_servant')
          .get();
      List<ServiceHistoryModel> data = [];
      for (var element in snapshot.docs) {
        data.add(ServiceHistoryModel.fromJson(element.data()));
      }
      return data;
    } on Exception {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: kDarkSecondColor,
            title: Text(
              'Error',
              style: Styles.textStyle20.copyWith(color: kPrimaryColor),
            ),
            content: Text(
              'حدث خظأ اثناء جلب البيانات من السيرفر برجاء المحاولة مره اخري',
              style: Styles.textStyle16.copyWith(
                color: kSecondColor,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'خروج',
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ],
          );
        },
      );
    }
  }
}
