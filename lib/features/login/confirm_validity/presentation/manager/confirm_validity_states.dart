part of 'confirm_validity_cubit.dart';

@immutable
sealed class ConfirmValidityState {}

final class ConfirmValidityInitial extends ConfirmValidityState {}

final class ConfirmValidityChangeObscurePassword extends ConfirmValidityState {}

final class ConfirmValidityChangeAutovalidateMode
    extends ConfirmValidityState {}
