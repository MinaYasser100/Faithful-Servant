import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/search/presentation/data/ma5domeen_search_repo/ma5domeen_search_repo.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ma5domeen_search_state.dart';

class Ma5domeenSearchCubit extends Cubit<Ma5domeenSearchState> {
  Ma5domeenSearchCubit(this.ma5domeenSearchRepo)
      : super(Ma5domeenSearchInitial());

  final Ma5domeenSearchRepo ma5domeenSearchRepo;

  List<Ma5domeenModel> ma5domeenData1 = [];

  Future<void> gettingMa5domeenData(String stageName) async {
    try {
      UserModel? user = await getUserData();
      QuerySnapshot<Map<String, dynamic>> docments = await ma5domeenSearchRepo
          .getAllMa5domeenData(stageName, user!.church);
      for (var element in docments.docs) {
        ma5domeenData1.add(Ma5domeenModel.fromJson(element.data()));
      }
      emit(Ma5domeenSearchCubitGetMa5domeenDataSuccess());
    } catch (e) {
      emit(Ma5domeenSearchCubitGetMa5domeenDataFailure());
    }
  }
}
