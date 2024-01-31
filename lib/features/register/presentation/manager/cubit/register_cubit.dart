import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/features/register/data/register_repo/register_reop.dart';
import 'package:faithful_servant/features/register/data/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  IconData suffixIcon = Icons.visibility_off_outlined;
  bool obscurePassword = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  IconData confirmSuffixIcon = Icons.visibility_off_outlined;
  bool obscureConfirmPassword = true;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final RegisterRepo registerRepo;
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
    required String phoneNum1,
    required String phoneNum2,
    required String image,
    required String nationalId,
    required String privilage,
    required String church,
    required String numberOfnumber,
    required String streetName,
    required String addressOfArea,
    required String qualification,
    required String currentService,
  }) async {
    emit(RegisterCubitPutUserInformationInFirebaseLoading());
    try {
      UserModel userModel = UserModel(
        userID: userID,
        name: name,
        email: email,
        phoneNum1: phoneNum1,
        phoneNum2: phoneNum2,
        image: image,
        nationalId: nationalId,
        privilage: privilage,
        church: church,
        numberOfnumber: numberOfnumber,
        streetName: streetName,
        addressOfArea: addressOfArea,
        qualification: qualification,
        currentService: currentService,
      );
      registerRepo.putUserInformationInFirebase(
          userModel: userModel, userId: userID, church: church);
      // firestore.collection('users').doc(userID).set(userModel.toJson());
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
    required String phoneNum1,
    required String phoneNum2,
    required String image,
    required String nationalId,
    required String privilage,
    required String church,
    required String numberOfnumber,
    required String qualification,
    required String streetName,
    required String addressOfArea,
    required String currentService,
  }) async {
    emit(RegisterCubitUserRgistrationLoading());
    try {
      UserCredential userCredential =
          await registerRepo.registerUser(email: email, password: password);
      // await FirebaseAuth.instance
      //     .createUserWithEmailAndPassword(email: email, password: password);
      putUserInformationInFirebase(
        userID: userCredential.user!.uid,
        name: name,
        email: email,
        phoneNum1: phoneNum1,
        phoneNum2: phoneNum2,
        image: image,
        nationalId: nationalId,
        privilage: privilage,
        church: church,
        numberOfnumber: numberOfnumber,
        streetName: streetName,
        addressOfArea: addressOfArea,
        qualification: qualification,
        currentService: currentService,
      );
      emit(RegisterCubitUserRgistrationSuccess());
    } catch (e) {
      emit(RegisterCubitUserRgistrationFailure(errorMessage: e.toString()));
    }
  }
}
