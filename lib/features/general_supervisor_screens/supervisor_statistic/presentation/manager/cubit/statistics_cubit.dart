import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/general_supervisor_repo/general_supervisor_repo.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit(this.generalSupervisorRepo) : super(StatisticsInitial());
  final GeneralSupervisorRepo generalSupervisorRepo;
  List<int> kgList = [];
  List<int> primaryList = [];
  List<int> perAndSecList = [];
  List<int> adultsList = [];
  Future<void> getKgStatistics() async {
    emit(StatisticsKgLoading());
    UserModel? userModel = await getUserData();
    try {
      if (userModel != null) {
        await generalSupervisorRepo.getKG1Statistics(userModel).then((value) {
          if (value.docs.isNotEmpty) {
            kgList.add(value.docs.length);
          } else {
            kgList.add(0);
          }
        });
        await generalSupervisorRepo.getKG2Statistics(userModel).then((value) {
          if (value.docs.isNotEmpty) {
            kgList.add(value.docs.length);
          } else {
            kgList.add(0);
          }
          emit(StatisticsKG2Success());
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getPrimary1Statistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            primaryList.add(value.docs.length);
          } else {
            primaryList.add(0);
          }
          emit(StatisticsPrimary1Success());
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getPrimary2Statistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            primaryList.add(value.docs.length);
          } else {
            primaryList.add(0);
          }
          emit(StatisticsPrimary2Success());
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getPrimary3Statistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            primaryList.add(value.docs.length);
          } else {
            primaryList.add(0);
          }
          emit(StatisticsPrimary3Success());
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getPrimary4Statistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            primaryList.add(value.docs.length);
          } else {
            primaryList.add(0);
          }
          emit(StatisticsPrimary4Success());
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getPrimary5Statistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            primaryList.add(value.docs.length);
          } else {
            primaryList.add(0);
          }
          emit(StatisticsPrimary5Success());
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getPrimary6Statistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            primaryList.add(value.docs.length);
          } else {
            primaryList.add(0);
          }
          emit(StatisticsPrimary6Success());
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getPerparatoryGirlsStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            perAndSecList.add(value.docs.length);
          } else {
            perAndSecList.add(0);
          }
          emit(StatisticsPerparatoryGirlsSuccess());
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getPerparatoryBoysStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            perAndSecList.add(value.docs.length);
          } else {
            perAndSecList.add(0);
          }
          emit(StatisticsPerparatoryBoysSuccess());
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getSecondaryGirlsStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            perAndSecList.add(value.docs.length);
          } else {
            perAndSecList.add(0);
          }
          emit(StatisticsSecondaryGirlsSuccess());
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getSecondaryBoysStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            perAndSecList.add(value.docs.length);
          } else {
            perAndSecList.add(0);
          }
          emit(StatisticsSecondaryBoysSuccess());
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getStudentsStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            adultsList.add(value.docs.length);
          } else {
            adultsList.add(0);
          }
          emit(StatisticsStudentsSuccess());
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getGraduatesStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            adultsList.add(value.docs.length);
          } else {
            adultsList.add(0);
          }
          emit(StatisticsGraduatesSuccess());
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getPeopleStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            adultsList.add(value.docs.length);
          } else {
            adultsList.add(0);
          }
          emit(StatisticsPeopleSuccess());
        });
      }
      if (userModel != null) {
        await generalSupervisorRepo.getMenStatistics(userModel).then((value) {
          if (value.docs.isNotEmpty) {
            adultsList.add(value.docs.length);
          } else {
            adultsList.add(0);
          }
          emit(StatisticsMenSuccess());
        });
      }
    } catch (e) {
      // TODO
    }
  }
}
