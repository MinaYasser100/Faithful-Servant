import 'package:faithful_servant/features/all_servants/data/repo/all_servants_repo.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_servants_states.dart';

class AllServantsCubit extends Cubit<AllServantsStates> {
  AllServantsCubit(this.allServantsRepo) : super(AllServantsCuibtInitial());
  final AllServantsRepo allServantsRepo;
  Future<void> getAllServantForStage({required String currentService}) async {
    emit(AllServantsCubitGetAllServantForStageLoading());
    try {
      List<UserModel> users =
          await allServantsRepo.getAllServantsFromFirebase();
      List<UserModel> serviceUsers = users
          .where((user) => user.currentService.contains(currentService))
          .toList();
      emit(AllServantsCubitGetAllServantForStageSuccess(
          serviceUsers: serviceUsers));
    } catch (e) {
      emit(AllServantsCubitGetAllServantForStageFailure(
          errorMessage: e.toString()));
    }
  }
}
