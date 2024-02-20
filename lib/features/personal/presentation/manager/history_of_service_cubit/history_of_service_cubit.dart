// ignore_for_file: use_build_context_synchronously
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/personal/data/Models/services_history_model/service_history_model.dart';
import 'package:faithful_servant/features/personal/data/controllers/controllers_of_add_history_service.dart';
import 'package:faithful_servant/features/personal/data/repos/services_history_repos.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';
part 'history_of_service_state.dart';

class HistoryOfServiceCubit extends Cubit<HistoryOfServiceState> {
  HistoryOfServiceCubit(this.servicehistoryrepo)
      : super(HistoryOfServiceInitial());

  final ServicesHistoryRepo servicehistoryrepo;
  static final List<ServiceHistoryModel> dataListHistoryCards = [];

  void emitini() {
    emit(HistoryOfServiceInitial());
  }

  void emitEditModeCard() {
    emit(EditModeCard());
  }

  void emitelesplace() {
    emit(Selectedelseplace());
  }

  init() async {
    emit(Fetchhistorydataloading());
    UserModel? user = await getUserData();
    if (user != null) {
      try {
        await FirebaseFirestore.instance
            .collection(churchNamesBasedOnCode[user.church])
            .doc(user.church)
            .collection('history_of_servant')
            .doc(user.userID)
            .get()
            .then((value) {
          dataListHistoryCards.clear();
          print(value.data());
          if (value.data() != null) {
            value.data()!['history'].forEach((element) {
              print(element);
              dataListHistoryCards.add(ServiceHistoryModel.fromJson(element));
            });
          }
        });
        emit(Fetchhistorydatasuccess());
      } on Exception {
        emit(Fetchhistorydatafailure());
      }
    } else {
      emit(Fetchhistorydatafailure());
    }
  }

  void editExistServiceInHistory(
      {required ServiceHistoryModel data,
      required BuildContext context}) async {
    EasyLoading.show(status: 'يتم التعديل الان ...');
    emit(EditModeCardLoading());
    UserModel? user = await getUserData();
    if (user != null) {
      try {
        await servicehistoryrepo.editServiceInHistory(
            data: data, userModel: user, context: context);
        emit(EditModeCardsuccess());
      } on Exception {
        emit(EditModeCardfailur());
      }
    } else {
      emit(EditModeCardfailur());
    }
    EasyLoading.dismiss();
  }

  void editinitdata({required ServiceHistoryModel data}) {
    selectedservice = data.service;
    selectedrole = data.role;
    AddServiceHistoryControllers.historydurationcontroller.text = data.duration;
    if (data.place == "كنيسة مارجرجس") {
      selectedplace = data.place;
      emitini();
    } else {
      selectedplace = "اخري";
      emitelesplace();
    }
  }

  submitNewHistory() {}
}
