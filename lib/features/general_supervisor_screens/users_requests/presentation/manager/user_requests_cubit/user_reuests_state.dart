part of 'user_reuests_cubit.dart';

sealed class UserReuestsState {}

final class UserReuestsInitial extends UserReuestsState {}

final class UserReuestsGetUsersRequestsFromFirebaseSuccess
    extends UserReuestsState {}

final class UserReuestsGetUsersRequestsFromFirebaseLoading
    extends UserReuestsState {}

final class UserReuestsGetUsersRequestsFromFirebaseFailure
    extends UserReuestsState {}

final class UserReuestsFetchUsersFromFirebaseLoading extends UserReuestsState {}

final class UserReuestsFetchUsersFromFirebaseSuccess extends UserReuestsState {}

final class UserReuestsFetchUsersFromFirebaseFailure extends UserReuestsState {}
