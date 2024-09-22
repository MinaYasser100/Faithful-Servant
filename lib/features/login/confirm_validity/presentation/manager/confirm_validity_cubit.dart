import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'confirm_validity_states.dart';

class ConfirmValidityCubit extends Cubit<ConfirmValidityState> {
  ConfirmValidityCubit() : super(ConfirmValidityInitial());

  IconData suffixIcon = Icons.visibility_off_outlined;
  bool obscurePassword = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void changeShowPassword() {
    obscurePassword = !obscurePassword;
    suffixIcon = obscurePassword == true
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(ConfirmValidityChangeObscurePassword());
  }

  void changeAutovalidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(ConfirmValidityChangeAutovalidateMode());
  }
}
