import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'general_supervisor_state.dart';

class GeneralSupervisorCubit extends Cubit<GeneralSupervisorState> {
  GeneralSupervisorCubit() : super(GeneralSupervisorInitial());
  int total = 0;
  void getNumberOfServant() async {
    emit(GeneralSupervisorGetNumberOfServantLoading());
    try {
      UserModel? userModel = await getUserData();
      if (userModel != null) {
        List<UserModel> allServant = [];
        await FirebaseFirestore.instance
            .collection(churchNamesBasedOnCode[userModel.church])
            .doc(userModel.church)
            .collection('users')
            .where('privilage', isNotEqualTo: "المشرف العام")
            .get()
            .then((value) {
          if (value.docs.isNotEmpty) {
            allServant.addAll(value.docs
                .map((element) => UserModel.fromJson(element.data()))
                .toList());

            allServant = allServant
                .where((servant) => servant.isActive == true)
                .toList();
            total = allServant.length;
          } else {
            total = 0;
          }
          emit(GeneralSupervisorGetNumberOfGeneralServantSuccess());
        });
      }
    } catch (e) {
      emit(GeneralSupervisorGetNumberOfServantfailure(
          errorMessage: e.toString()));
    }
  }
}
