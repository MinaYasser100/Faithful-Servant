import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_user_request_details_states.dart';

class GetUserRequestDetailsCubit extends Cubit<GetUserRequestDetailsStates> {
  GetUserRequestDetailsCubit() : super(GetUserRequestDetailsCubitInitial());

  Future<void> getUserRequestData({required UserModel userModel}) async {
    emit(GetUserRequestDataLoading());
    try {
      var user = await FirebaseFirestore.instance
          .collection(churchNamesBasedOnCode[userModel.church])
          .doc(userModel.church)
          .collection('users')
          .doc(userModel.userID)
          .get();
      if (user.exists) {
        UserModel updateUser = UserModel.fromJson(user.data()!);
        emit(GetUserRequestDataSuccess(userModel: updateUser));
      } else {
        emit(GetUserRequestDataFailure(errorMessage: 'Not found this servant'));
      }
    } catch (e) {
      emit(GetUserRequestDataFailure(errorMessage: e.toString()));
    }
  }
}
