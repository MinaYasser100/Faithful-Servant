import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'forgotten_password_state.dart';

class ForgottenPasswordCubit extends Cubit<ForgottenPasswordState> {
  ForgottenPasswordCubit() : super(ForgottenPasswordInitial());

  FirebaseAuth auth = FirebaseAuth.instance;

  void changePassword({required String email}) async {
    emit(ForgetPasswordCheckUserEmailLoading());
    try {
      await auth.sendPasswordResetEmail(email: email);
      emit(ForgetPasswordCheckUserEmailSuccess());
    } on FirebaseAuthException catch (e) {
      emit(ForgetPasswordCheckUserEmailFailure(errorMessage: e.toString()));
    }
  }
}
