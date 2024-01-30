import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
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
      emit(LoginCubitLoginUserSuccess(userId: userCredential.user!.uid));
    } catch (e) {
      emit(LoginCubitLoginUserfailure(errorMessage: e.toString()));
    }
  }
}
