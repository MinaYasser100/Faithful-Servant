part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginCubitChangeObscurePassword extends LoginState {}

final class LoginCubitChangeAutovalidateMode extends LoginState {}

final class LoginCubitLoginUserLoading extends LoginState {}

final class LoginCubitLoginUserSuccess extends LoginState {
  final String userId;

  LoginCubitLoginUserSuccess({required this.userId});
}

final class LoginCubitLoginUserfailure extends LoginState {
  final String errorMessage;

  LoginCubitLoginUserfailure({required this.errorMessage});
}

final class LoginCubitGetUserInforamtionLoading extends LoginState {}

final class LoginCubitGetUserInformationSuccess extends LoginState {}

final class LoginCubitGetUserInformationFailure extends LoginState {}

final class LoginCubitFailure extends LoginState {}

final class LoginCubitLogoutThisAccount extends LoginState {}

final class LoginCubitDeleteUserEmailSuccess extends LoginState {}

final class LoginCubitDeleteUserEmailFailure extends LoginState {}

final class LoginCubitDeleteUserEmailLoading extends LoginState {}

final class LoginCubitGetUserDataFromHiveLoading extends LoginState {}

final class LoginCubitGetUserDataFromHiveSuccess extends LoginState {}
