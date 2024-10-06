part of 'change_privilage_or_service_cubit.dart';

sealed class ChangePrivilageOrServiceState extends Equatable {
  const ChangePrivilageOrServiceState();

  @override
  List<Object> get props => [];
}

final class ChangePrivilageOrServiceInitial
    extends ChangePrivilageOrServiceState {}

final class ChangePrivilageOrServiceLoading
    extends ChangePrivilageOrServiceState {}

final class ChangePrivilageOrServiceSuccess
    extends ChangePrivilageOrServiceState {}

final class ChangePrivilageOrServiceFailure
    extends ChangePrivilageOrServiceState {
  final String errorMessage;

  const ChangePrivilageOrServiceFailure({required this.errorMessage});
}
