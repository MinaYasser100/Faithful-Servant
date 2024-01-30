part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterCubitChangeObscurePassword extends RegisterState {}

final class RegisterCubitChangeObscureConfirmPassword extends RegisterState {}

final class RegisterCubitChangeAutovalidateMode extends RegisterState {}

final class RegisterCubitPutUserInformationInFirebaseLoading
    extends RegisterState {}

final class RegisterCubitPutUserInformationInFirebaseFailure
    extends RegisterState {
  final String errorMessage;

  RegisterCubitPutUserInformationInFirebaseFailure(
      {required this.errorMessage});
}

final class RegisterCubitPutUserInformationInFirebaseSuccess
    extends RegisterState {}

final class RegisterCubitUserRgistrationLoading extends RegisterState {}

final class RegisterCubitUserRgistrationFailure extends RegisterState {
  final String errorMessage;

  RegisterCubitUserRgistrationFailure({required this.errorMessage});
}

final class RegisterCubitUserRgistrationSuccess extends RegisterState {}
