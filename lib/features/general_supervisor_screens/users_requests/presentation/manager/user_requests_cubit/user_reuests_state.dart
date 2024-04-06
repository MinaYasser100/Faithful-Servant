part of 'user_reuests_cubit.dart';

sealed class UserRequestsState {}

final class UserReuestsInitial extends UserRequestsState {}

final class UserRequestsGetUsersRequestsFromFirebaseSuccess
    extends UserRequestsState {}

final class UserRequestsGetUsersRequestsFromFirebaseLoading
    extends UserRequestsState {}

final class UserRequestsGetUsersRequestsFromFirebaseFailure
    extends UserRequestsState {}

final class UserRequestsFetchUsersFromFirebaseLoading
    extends UserRequestsState {}

final class UserRequestsFetchUsersFromFirebaseSuccess
    extends UserRequestsState {}

final class UserRequestsFetchUsersFromFirebaseFailure
    extends UserRequestsState {}

final class UserRequestsActiveUserLoading extends UserRequestsState {}

final class UserRequestsActiveUserSuccess extends UserRequestsState {}

final class UserRequestsActiveUserFailure extends UserRequestsState {}
