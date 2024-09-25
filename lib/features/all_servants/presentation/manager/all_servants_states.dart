part of 'all_servants_cubit.dart';

@immutable
sealed class AllServantsStates {}

final class AllServantsCuibtInitial extends AllServantsStates {}

final class AllServantsCubitGetAllServantForStageLoading
    extends AllServantsStates {}

final class AllServantsCubitGetAllServantForStageSuccess
    extends AllServantsStates {
  final List<UserModel> serviceUsers;

  AllServantsCubitGetAllServantForStageSuccess({required this.serviceUsers});
}

final class AllServantsCubitGetAllServantForStageFailure
    extends AllServantsStates {
  final String errorMessage;

  AllServantsCubitGetAllServantForStageFailure({required this.errorMessage});
}
