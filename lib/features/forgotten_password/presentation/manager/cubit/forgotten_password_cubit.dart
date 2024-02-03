import 'package:faithful_servant/features/forgotten_password/data/forgotten_password_repo/forgotten_password_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'forgotten_password_state.dart';

class ForgottenPasswordCubit extends Cubit<ForgottenPasswordState> {
  ForgottenPasswordCubit(this.forgottenPasswordRepo)
      : super(ForgottenPasswordInitial());

  final ForgottenPasswordRepo forgottenPasswordRepo;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void changePassword({required String email}) async {
    emit(ForgetPasswordCheckUserEmailLoading());
    try {
      forgottenPasswordRepo.changePasswordInFirebase(email: email);
      emit(ForgetPasswordCheckUserEmailSuccess());
    } on FirebaseAuthException catch (e) {
      emit(ForgetPasswordCheckUserEmailFailure(errorMessage: e.toString()));
    }
  }

  void changeAuotvalidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(ForgottenPasswordChangeAutovalidateMode());
  }
}
