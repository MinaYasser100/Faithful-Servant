part of 'get_user_request_details_cubit.dart';

@immutable
sealed class GetUserRequestDetailsStates {}

final class GetUserRequestDetailsCubitInitial
    extends GetUserRequestDetailsStates {}

final class GetUserRequestDataLoading extends GetUserRequestDetailsStates {}

final class GetUserRequestDataSuccess extends GetUserRequestDetailsStates {
  final UserModel userModel;

  GetUserRequestDataSuccess({required this.userModel});
}

final class GetUserRequestDataFailure extends GetUserRequestDetailsStates {
  final String errorMessage;

  GetUserRequestDataFailure({required this.errorMessage});
}
