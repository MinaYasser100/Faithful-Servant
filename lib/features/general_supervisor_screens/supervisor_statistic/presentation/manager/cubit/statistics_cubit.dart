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
  List<int> servantList = [];
  List<int> someServicesList = [];
  List<int> someOtherServicesList = [];
  Future<void> getKgStatistics() async {
    emit(StatisticsLoading());
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
        });
      }
      if (userModel != null) {
        await generalSupervisorRepo.getMenStatistics(userModel).then((value) {
          if (value.docs.isNotEmpty) {
            adultsList.add(value.docs.length);
          } else {
            adultsList.add(0);
          }
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getServantStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            servantList.add(value.docs.length);
          } else {
            servantList.add(0);
          }
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getSundayServantsStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            servantList.add(value.docs.length);
          } else {
            servantList.add(0);
          }
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getPrepareServantsStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            servantList.add(value.docs.length);
          } else {
            servantList.add(0);
          }
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getMothoerDulajiStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            someServicesList.add(value.docs.length);
          } else {
            someServicesList.add(0);
          }
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getWisdomsStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            someServicesList.add(value.docs.length);
          } else {
            someServicesList.add(0);
          }
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo.getStageStatistics(userModel).then((value) {
          if (value.docs.isNotEmpty) {
            someServicesList.add(value.docs.length);
          } else {
            someServicesList.add(0);
          }
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getDemonstrationToolsStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            someServicesList.add(value.docs.length);
          } else {
            someServicesList.add(0);
          }
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getBrothersOfLordStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            someServicesList.add(value.docs.length);
          } else {
            someServicesList.add(0);
          }
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getCoralsStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            someOtherServicesList.add(value.docs.length);
          } else {
            someOtherServicesList.add(0);
          }
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getFestivalCoordinatorsStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            someOtherServicesList.add(value.docs.length);
          } else {
            someOtherServicesList.add(0);
          }
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getScoutsStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            someOtherServicesList.add(value.docs.length);
          } else {
            someOtherServicesList.add(0);
          }
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getCounselingCentreStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            someOtherServicesList.add(value.docs.length);
          } else {
            someOtherServicesList.add(0);
          }
        });
      }

      if (userModel != null) {
        await generalSupervisorRepo
            .getDeaconsSchooltatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            someOtherServicesList.add(value.docs.length);
          } else {
            someOtherServicesList.add(0);
          }
          emit(StatisticsDeaconsSchoolSuccess());
        });
      }
    } catch (e) {
      emit(StatisticsFailure());
    }
  }
}
