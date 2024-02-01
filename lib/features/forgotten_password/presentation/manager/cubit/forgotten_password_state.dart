part of 'forgotten_password_cubit.dart';

@immutable
sealed class ForgottenPasswordState {}

final class ForgottenPasswordInitial extends ForgottenPasswordState {}

final class ForgetPasswordCheckUserEmailLoading
    extends ForgottenPasswordState {}

final class ForgetPasswordCheckUserEmailSuccess
    extends ForgottenPasswordState {}

final class ForgetPasswordCheckUserEmailFailure extends ForgottenPasswordState {
  final String errorMessage;

  ForgetPasswordCheckUserEmailFailure({required this.errorMessage});
}
