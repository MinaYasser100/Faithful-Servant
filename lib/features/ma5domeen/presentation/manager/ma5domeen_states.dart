sealed class Ma5domeenStates {}

final class Ma5domeenStatesInitial extends Ma5domeenStates {}

final class Loading
    extends Ma5domeenStates {}

final class PutMa5domeenDataSuccess
    extends Ma5domeenStates {}

final class PutMa5domeenDataFaild
    extends Ma5domeenStates {}

final class GetMa5domeenDataSuccess
    extends Ma5domeenStates {
  final String errorMessage;

  GetMa5domeenDataSuccess({required this.errorMessage});
}
