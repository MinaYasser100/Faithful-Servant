part of 'user_informations_cubit.dart';

@immutable
sealed class UserInformationsState {}

final class UserInformationsInitial extends UserInformationsState {}

final class UserInformationsGetUserInformationsLoading
    extends UserInformationsState {}

final class UserInformationsGetUserInformationsSuccess
    extends UserInformationsState {
  final UserModel userModel;

  UserInformationsGetUserInformationsSuccess({required this.userModel});
}

final class UserInformationsGetUserInformationsFailure
    extends UserInformationsState {}
