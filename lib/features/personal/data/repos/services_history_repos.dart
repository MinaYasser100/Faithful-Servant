import 'package:faithful_servant/features/personal/data/Models/services_history_model/service_history_model.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';

abstract class ServicesHistoryRepo {
  Future<void> addNewOrEditServiceToHistory(
      {required ServiceHistoryModel data,
      required UserModel userModel,
      required BuildContext context,
      required bool edit,
      int? index});
}
