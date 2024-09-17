import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Ma5domeenCubit extends Cubit<Ma5domeenStates> {
  Ma5domeenCubit() : super(Ma5domeenStatesInitial());
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String result = "";
  void changeAutovalidateMode() {
    autovalidateMode = AutovalidateMode.always;
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
    String dateOBDCommand = DateTime.now().toString();
    DateTime date = DateTime.parse(dateOBDCommand);
    String result = DateFormat('yyyy-MM-dd | HH:mm').format(date);
    try {
      Ma5domeenModel ma5domeenModel = Ma5domeenModel(
          updateRegisterDate: result,
          registerDate: result,
          adderName: adderName,
          name: name,
          church: church,
          address: address,
          qualification: qualification,
          fatherOfConfession: fatherOfConfession,
          birthDate: birthdate,
          phoneNumber1: phoneNumber1,
          phoneNumber2: phoneNumber2);
      await FirebaseFirestore.instance
          .collection("ma5domeen")
          .doc(church)
          .collection(namestage)
          .doc()
          .set(ma5domeenModel.toJson());
      emit(PutMa5domeenDataSuccess());
    } catch (e) {
      emit(PutMa5domeenDataFaild());
    }
  }

  //getting data from firebase
  Future<void> gettingMa5domeenData(String stageName) async {
    emit(Ma5domeenCubitGetMa5domeenDataLoading());
    try {
      var docments = (await FirebaseFirestore.instance
          .collection("ma5domeen")
          .doc(church)
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
}
