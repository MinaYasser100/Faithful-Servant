import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/core/function/save_user_data.dart';
import 'package:faithful_servant/core/helper/cache_helper.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/features/login/data/login_repo/login_repo.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;
  IconData suffixIcon = Icons.visibility_off_outlined;
  bool obscurePassword = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void changeShowPassword() {
    obscurePassword = !obscurePassword;
    suffixIcon = obscurePassword == true
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(LoginCubitChangeObscurePassword());
  }

  void changeAutovalidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(LoginCubitChangeAutovalidateMode());
  }

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginCubitLoginUserLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await findUserInformationWhenLogin(userID: userCredential.user!.uid);
      emit(LoginCubitLoginUserSuccess(userId: userCredential.user!.uid));
    } catch (e) {
      emit(LoginCubitLoginUserfailure(errorMessage: e.toString()));
    }
  }

  UserModel? userModel;
  Future<void> findUserInformationWhenLogin({required String userID}) async {
    emit(LoginCubitGetUserInforamtionLoading());
    try {
      await Hive.openBox<UserModel>(kUserBox);
      DocumentSnapshot<Map<String, dynamic>> value = await FirebaseFirestore
          .instance
          .collection(saintGeorge)
          .doc(selectChurch[saintGeorge])
          .collection('users')
          .doc(userID)
          .get();
      if (value.exists) {
        userModel = UserModel.fromJson(value.data()!);
      } else {
        value = await FirebaseFirestore.instance
            .collection(virginMary)
            .doc(selectChurch[virginMary])
            .collection('users')
            .doc(userID)
            .get();
        if (value.exists) {
          userModel = UserModel.fromJson(value.data()!);
        } else {
          value = await FirebaseFirestore.instance
              .collection(saintMark)
              .doc(selectChurch[saintMark])
              .collection('users')
              .doc(userID)
              .get();
          if (value.exists) {
            userModel = UserModel.fromJson(value.data()!);
          } else {
            value = await FirebaseFirestore.instance
                .collection(saintMain)
                .doc(selectChurch[saintMain])
                .collection('users')
                .doc(userID)
                .get();
            if (value.exists) {
              userModel = UserModel.fromJson(value.data()!);
            } else {
              print("this user is not found");
            }
          }
        }
      }
      saveUserData(UserModel.fromJson(value.data()!));
      emit(LoginCubitGetUserInformationSuccess());
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  void logoutMethod() async {
    CacheHelper.removeData(key: kUserId).then((value) async {
      CacheHelper.removeData(key: kHomeView);
      var box = await Hive.openBox<UserModel>(kUserBox);
      await box.clear();
      await box.close();
      Get.offAllNamed(GetPages.kWelcomeView);
      emit(LoginCubitLogoutThisAccount());
    });
  }

  Future<void> deleteUserEmail() async {
    emit(LoginCubitDeleteUserEmailLoading());
    UserModel? userModel = await getUserData();
    try {
      if (userModel != null) {
        await loginRepo.deleteUserEmail();
        await loginRepo
            .deleteUserInformationFromFirebase(userModel: userModel)
            .then((value) {
          logoutMethod();
        });
      }
      emit(LoginCubitDeleteUserEmailSuccess());
    } catch (e) {
      emit(LoginCubitDeleteUserEmailFailure());
    }
  }
}
