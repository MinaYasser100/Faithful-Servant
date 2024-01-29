part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterCubitChangeObscurePassword extends RegisterState {}

final class RegisterCubitChangeObscureConfirmPassword extends RegisterState {}

final class RegisterCubitChangeAutovalidateMode extends RegisterState {}
