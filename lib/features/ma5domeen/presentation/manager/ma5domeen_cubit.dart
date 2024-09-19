import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_states.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Ma5domeenCubit extends Cubit<Ma5domeenStates> {
  Ma5domeenCubit() : super(Ma5domeenStatesInitial());
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String result = "";

  void changeAutovalidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(Ma5domeenCubitChangeAutovalidateMode());
  }

  //store data in firebase
  void putMa5domeenDataInFirebase(
      {required String name,
      required String phoneNumber1,
      required String phoneNumber2,
      required String birthdate,
      required String address,
      required String qualification,
      required String fatherOfConfession,
      required String namestage}) async {
    emit(PutMa5domeenDataLoading());
    UserModel? user = await getUserData();
    String dateOBDCommand = DateTime.now().toString();
    DateTime date = DateTime.parse(dateOBDCommand);
    String result = DateFormat('yyyy-MM-dd | HH:mm').format(date);
    try {
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      Ma5domeenModel ma5domeenModel = Ma5domeenModel(
        updateRegisterDate: result,
        registerDate: result,
        adderName: user!.name,
        name: name,
        church: user.church,
        address: address,
        qualification: qualification,
        fatherOfConfession: fatherOfConfession,
        birthDate: birthdate,
        phoneNumber1: phoneNumber1,
        phoneNumber2: phoneNumber2,
        id: id,
        stagename: namestage,
      );
      await FirebaseFirestore.instance
          .collection("ma5domeen")
          .doc(user.church)
          .collection(namestage)
          .doc(id)
          .set(ma5domeenModel.toJson());
      emit(PutMa5domeenDataSuccess());
    } catch (e) {
      emit(PutMa5domeenDataFaild(e.toString()));
    }
  }

  //getting data from firebase
  Future<void> gettingMa5domeenData(String stageName) async {
    emit(Ma5domeenCubitGetMa5domeenDataLoading());
    UserModel? user = await getUserData();
    try {
      var docments = (await FirebaseFirestore.instance
          .collection("ma5domeen")
          .doc(user!.church)
          .collection(stageName)
          .get());
      List<Ma5domeenModel> ma5domeenData1 = [];
      for (var element in docments.docs) {
        ma5domeenData1.add(Ma5domeenModel.fromJson(element.data()));
      }
      emit(
          Ma5domeenCubitGetMa5domeenDataSuccess(ma5domeenData: ma5domeenData1));
    } catch (e) {
      emit(Ma5domeenCubitGetMa5domeenDataFailure(errorMessage: e.toString()));
    }
  }

  deleteMa5doom({required String stageName, required String servedId}) async {
    UserModel? user = await getUserData();
    await FirebaseFirestore.instance
        .collection("ma5domeen")
        .doc(user!.church)
        .collection(stageName)
        .doc(servedId)
        .delete();
  }

  void editMa5domeenData({
    required String name,
    required String phoneNumber1,
    required String phoneNumber2,
    required String birthdate,
    required String address,
    required String qualification,
    required String fatherOfConfession,
    required String namestage,
    required Ma5domeenModel ma5domeenModel1,
  }) async {
    emit(EditMa5domeenDataLoading());
    UserModel? user = await getUserData();
    String dateOBDCommand = DateTime.now().toString();
    DateTime date = DateTime.parse(dateOBDCommand);
    String result = DateFormat('yyyy-MM-dd | HH:mm').format(date);
    try {
      Ma5domeenModel ma5domeenModel = Ma5domeenModel(
        updateRegisterDate: result,
        registerDate: ma5domeenModel1.registerDate,
        adderName: user!.name,
        name: name,
        church: user.church,
        address: address,
        qualification: qualification,
        fatherOfConfession: fatherOfConfession,
        birthDate: birthdate,
        phoneNumber1: phoneNumber1,
        phoneNumber2: phoneNumber2,
        id: ma5domeenModel1.id,
        stagename: namestage,
      );
      await FirebaseFirestore.instance
          .collection("ma5domeen")
          .doc(user.church)
          .collection(namestage)
          .doc(ma5domeenModel1.id)
          .update(ma5domeenModel.toJson());
      emit(EditMa5domeenDataSuccess());
    } catch (e) {
      emit(EditMa5domeenDataFailure(e.toString()));
    }
  }
}
