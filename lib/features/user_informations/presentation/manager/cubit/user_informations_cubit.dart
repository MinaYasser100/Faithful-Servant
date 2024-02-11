import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_informations_state.dart';

class UserInformationsCubit extends Cubit<UserInformationsState> {
  UserInformationsCubit() : super(UserInformationsInitial());

  UserModel? userModel;
  Future<void> getUserInformations() async {
    emit(UserInformationsGetUserInformationsLoading());
    try {
      userModel = await getUserData();
      emit(UserInformationsGetUserInformationsSuccess(userModel: userModel!));
    } catch (e) {
      emit(UserInformationsGetUserInformationsFailure());
    }
  }
}
