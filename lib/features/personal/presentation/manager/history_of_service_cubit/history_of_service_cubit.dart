// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/general_not_detailed_error_dialog.dart';
import 'package:faithful_servant/features/personal/data/Models/services_history_model/service_history_model.dart';
import 'package:faithful_servant/features/personal/data/controllers/controllers_of_add_history_service.dart';
import 'package:faithful_servant/features/personal/data/repos/services_history_repos.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          if (value.data() != null) {
            value.data()!['history'].forEach((element) {
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

  void editinitdata({required ServiceHistoryModel data}) {
    selectedservice = data.service;
    selectedrole = data.role;
    AddServiceHistoryControllers.historydurationcontroller.text = data.duration;
    AddServiceHistoryControllers.historyplacecontroller.text = data.place;
    AddServiceHistoryControllers.historyrolecontroller.text = data.role;
    AddServiceHistoryControllers.historyservicecontroller.text = data.service;
    if (data.place == "كنيسة مارجرجس") {
      selectedplace = data.place;
    } else {
      selectedplace = "اخري";
    }
  }

  void resetdata() {
    selectedservice = "حضانة كيجي 1";
    selectedrole = "خادم";
    AddServiceHistoryControllers.historydurationcontroller.clear();
    AddServiceHistoryControllers.historyplacecontroller.text = "كنيسة مارجرجس";
    AddServiceHistoryControllers.historyrolecontroller.text = "خادم";
    AddServiceHistoryControllers.historyservicecontroller.text = "حضانة كيجي 1";
    selectedplace = "كنيسة مارجرجس";
  }

  Future<void> submitHistory(
      {required BuildContext context,
      required int index,
      required bool edit}) async {
    // add here function of sending data to firebase
    UserModel? usermodel = await getUserData();
    ServiceHistoryModel data = ServiceHistoryModel(
      duration: AddServiceHistoryControllers.historydurationcontroller.text,
      place: AddServiceHistoryControllers.historyplacecontroller.text,
      role: AddServiceHistoryControllers.historyrolecontroller.text,
      service: AddServiceHistoryControllers.historyservicecontroller.text,
    );
    if (usermodel != null) {
      await servicehistoryrepo.addNewOrEditServiceToHistory(
          edit: edit,
          data: data,
          userModel: usermodel,
          context: context,
          index: index);
      resetdata();
    } else {
      errorDialog(
          context, 'حدث خطأ في جلب بياناتك الشخصية رجاء محبة اعادة المحاولة');
    }
  }
}
