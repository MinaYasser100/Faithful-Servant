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
}
