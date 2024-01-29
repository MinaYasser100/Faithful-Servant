part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginCubitChangeObscurePassword extends LoginState {}

final class LoginCubitChangeAutovalidateMode extends LoginState {}
