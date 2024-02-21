// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/general_not_detailed_error_dialog.dart';
import 'package:faithful_servant/features/personal/data/Models/services_history_model/service_history_model.dart';
import 'package:faithful_servant/features/personal/data/repos/services_history_repos.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ServiceHistoryImplementaion implements ServicesHistoryRepo {
  @override
  Future<void> addNewOrEditServiceToHistory(
      {required ServiceHistoryModel data,
      required UserModel userModel,
      required BuildContext context,
      required bool edit,
      int? index}) async {
    try {
      EasyLoading.show(status: 'تحميل ...');
      DocumentSnapshot<Map<String, dynamic>> ref = await FirebaseFirestore
          .instance
          .collection(churchNamesBasedOnCode[userModel.church])
          .doc(userModel.church)
          .collection('history_of_servant')
          .doc(userModel.userID)
          .get();
      List<dynamic> history = [];
      if (ref.exists) {
        history = ref.data()!['history'];
        //edit or new
        if (edit && index != null) {
          //Edit
          history[index] = data.toJson();
          await FirebaseFirestore.instance
              .collection(churchNamesBasedOnCode[userModel.church])
              .doc(userModel.church)
              .collection('history_of_servant')
              .doc(userModel.userID)
              .update({
            "history": history,
          });
        } else {
          //new history entry
          history.add(data.toJson());
          await FirebaseFirestore.instance
              .collection(churchNamesBasedOnCode[userModel.church])
              .doc(userModel.church)
              .collection('history_of_servant')
              .doc(userModel.userID)
              .update({
            "history": history,
          });
        }
      } else {
        //new document - the user has not any document to store in
        history.add(data.toJson());
        await FirebaseFirestore.instance
            .collection(churchNamesBasedOnCode[userModel.church])
            .doc(userModel.church)
            .collection('history_of_servant')
            .doc(userModel.userID)
            .set({
          'history': history,
        });
      }
      EasyLoading.dismiss();
      Get.back(result: "success");
    } on Exception {
      errorDialog(
          context, 'حدث خظأ اثناء الاتصال بالسيرفر برجاء المحاولة مره اخري');
      Get.back(result: "falure");
    }
  }
}
