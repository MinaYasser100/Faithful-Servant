import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';

sealed class Ma5domeenStates {}

final class Ma5domeenStatesInitial extends Ma5domeenStates {}

final class PutMa5domeenDataSuccess extends Ma5domeenStates {}

final class PutMa5domeenDataLoading extends Ma5domeenStates {}

final class PutMa5domeenDataFaild extends Ma5domeenStates {
  final String errorMessage;

  PutMa5domeenDataFaild(this.errorMessage);
}

final class Ma5domeenCubitGetMa5domeenDataLoading extends Ma5domeenStates {}

final class Ma5domeenCubitGetMa5domeenDataSuccess extends Ma5domeenStates {
  final List<Ma5domeenModel> ma5domeenData;

  Ma5domeenCubitGetMa5domeenDataSuccess({required this.ma5domeenData});
}

final class Ma5domeenCubitGetMa5domeenDataFailure extends Ma5domeenStates {
  final String errorMessage;

  Ma5domeenCubitGetMa5domeenDataFailure({required this.errorMessage});
}

final class EditMa5domeenDataLoading extends Ma5domeenStates {}

final class EditMa5domeenDataSuccess extends Ma5domeenStates {}

final class EditMa5domeenDataFailure extends Ma5domeenStates {
  final String errorMessage;

  EditMa5domeenDataFailure(this.errorMessage);
}

final class Ma5domeenCubitChangeAutovalidateMode extends Ma5domeenStates {}
