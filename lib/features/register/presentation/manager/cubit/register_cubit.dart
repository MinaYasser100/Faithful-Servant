import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/features/register/data/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  IconData suffixIcon = Icons.visibility_off_outlined;
  bool obscurePassword = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  IconData confirmSuffixIcon = Icons.visibility_off_outlined;
  bool obscureConfirmPassword = true;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void changeShowPassword() {
    obscurePassword = !obscurePassword;
    suffixIcon = obscurePassword == true
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(RegisterCubitChangeObscurePassword());
  }

  void changeShowConfirmPassword() {
    obscureConfirmPassword = !obscureConfirmPassword;
    confirmSuffixIcon = obscureConfirmPassword == true
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(RegisterCubitChangeObscurePassword());
  }

  void changeAutovalidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(RegisterCubitChangeAutovalidateMode());
  }

  void putUserInformationInFirebase({
    required String userID,
    required String name,
    required String email,
    required String phone,
    required String image,
    required String nationalId,
    required String privilage,
    required String church,
    required String address,
    required String qualification,
    required String currentService,
  }) async {
    emit(RegisterCubitPutUserInformationInFirebaseLoading());
    try {
      UserModel userModel = UserModel(
        userID: userID,
        name: name,
        email: email,
        phone: phone,
        image: image,
        nationalId: nationalId,
        privilage: privilage,
        church: church,
        address: address,
        qualification: qualification,
        currentService: currentService,
      );
      firestore.collection('users').doc(userID).set(userModel.toJson());
      emit(RegisterCubitPutUserInformationInFirebaseSuccess());
    } catch (e) {
      emit(RegisterCubitPutUserInformationInFirebaseFailure(
          errorMessage: e.toString()));
    }
  }

  Future<void> userRegistration({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String image,
    required String nationalId,
    required String privilage,
    required String church,
    required String address,
    required String qualification,
    required String currentService,
  }) async {
    emit(RegisterCubitUserRgistrationLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      putUserInformationInFirebase(
        userID: userCredential.user!.uid,
        name: name,
        email: email,
        phone: phone,
        image: image,
        nationalId: nationalId,
        privilage: privilage,
        church: church,
        address: address,
        qualification: qualification,
        currentService: currentService,
      );
      emit(RegisterCubitUserRgistrationSuccess());
    } catch (e) {
      emit(RegisterCubitUserRgistrationFailure(errorMessage: e.toString()));
    }
  }
}
