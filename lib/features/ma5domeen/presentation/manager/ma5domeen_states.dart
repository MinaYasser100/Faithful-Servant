

import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';

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
 final List<Ma5domeenModel> ma5domeenData1 ;

  GetMa5domeenDataSuccess({required this.ma5domeenData1});


}
final class GetMa5domeenDataFaild
    extends Ma5domeenStates {}