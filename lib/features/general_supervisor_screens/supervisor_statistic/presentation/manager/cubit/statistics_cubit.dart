import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/general_supervisor_repo/general_supervisor_repo.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit(this.generalSupervisorRepo) : super(StatisticsInitial());
  final GeneralSupervisorRepo generalSupervisorRepo;
  List<int> kgList = [];
  Future<void> getAllStatistics() async {
    emit(StatisticsLoading());
    UserModel? userModel = await getUserData();
    if (userModel != null) {
      generalSupervisorRepo.getKG1Statistics(userModel).then((value) {
        if (value.docs.isNotEmpty) {
          kgList.add(value.docs.length);
        } else {
          kgList.add(0);
        }
      });
      generalSupervisorRepo.getKG2Statistics(userModel).then((value) {
        if (value.docs.isNotEmpty) {
          kgList.add(value.docs.length);
        } else {
          kgList.add(0);
        }
        emit(StatisticsKG2Success());
      });
    }
  }
}
