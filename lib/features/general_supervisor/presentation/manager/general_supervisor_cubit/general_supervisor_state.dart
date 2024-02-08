part of 'general_supervisor_cubit.dart';

@immutable
sealed class GeneralSupervisorState {}

final class GeneralSupervisorInitial extends GeneralSupervisorState {}

final class GeneralSupervisorGetNumberOfServantLoading
    extends GeneralSupervisorState {}

final class GeneralSupervisorGetNumberOfServantsuccess
    extends GeneralSupervisorState {}

final class GeneralSupervisorGetNumberOfServantfailure
    extends GeneralSupervisorState {
  final String errorMessage;

  GeneralSupervisorGetNumberOfServantfailure({required this.errorMessage});
}
