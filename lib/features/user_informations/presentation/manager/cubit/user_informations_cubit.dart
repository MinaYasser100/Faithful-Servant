import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'user_informations_state.dart';

class UserInformationsCubit extends Cubit<UserInformationsState> {
  UserInformationsCubit() : super(UserInformationsInitial());

  UserModel? userModel;
  Future<void> getUserInformations({String? id, bool? personal}) async {
    emit(UserInformationsGetUserInformationsLoading());
    try {
      userModel = await getUserData();
      if (!(personal ?? true)) {
        await FirebaseFirestore.instance
            .collection(churchNamesBasedOnCode[userModel!.church])
            .doc(userModel!.church)
            .collection("users")
            .doc(id)
            .get()
            .then((value) => userModel = UserModel.fromJson(value.data()!));
      }
      emit(UserInformationsGetUserInformationsSuccess(userModel: userModel!));
    } catch (e) {
      emit(UserInformationsGetUserInformationsFailure());
    }
  }
}
