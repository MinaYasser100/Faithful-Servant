import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/core/function/getting_day_date.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/error_aleart_dialog.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/general_supervisor_statistics_repo/general_supervisor_statistics_repo.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/pdf/api_pdf_for_supervisor.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../data/model/pdf_data_model.dart';

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
  int female = 0;
  int male = 0;
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
            .then((value) async {
          if (value.docs.isNotEmpty) {
            someOtherServicesList.add(value.docs.length);
          } else {
            someOtherServicesList.add(0);
          }
          emit(StatisticsDeaconsSchoolSuccess());
          await getNumberOfGender();
        });
      }
    } catch (e) {
      emit(StatisticsFailure());
    }
  }

  Future<void> getNumberOfGender() async {
    emit(StatisticsNumberByGenderLoading());
    UserModel? userModel = await getUserData();
    try {
      if (userModel != null) {
        await generalSupervisorRepo
            .getFemalestatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            female = value.docs.length;
          } else {
            female = 0;
          }
        });

        await generalSupervisorRepo
            .getMaleNumberStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            male = value.docs.length;
          } else {
            male = 0;
          }
        });

        await generalSupervisorRepo
            .getOurFatherStatistics(userModel)
            .then((value) {
          if (value.docs.isNotEmpty) {
            male = male - value.docs.length;
          }
          emit(StatisticsNumberByGendersuccess());
        });
      }
    } catch (e) {
      emit(StatisticsNumberByGenderFailure());
    }
  }

  void openPdfToPrintData() async {
    EasyLoading.show(
      status: 'Loading...'.tr,
    );
    UserModel? userModel = await getUserData();
    if (userModel != null) {
      try {
        PdfDataModel invoice = PdfDataModel(
          date: gettingDayDate(),
          role: 'اشراف',
          statisticTitle: 'اعداد خدام الخدمة',
          femalecount: female,
          malecount: male,
          name: userModel.name,
          service: userModel.currentService,
          churchName: churchNamesBasedOnCode[userModel.church],
          kg1Number: kgList[0],
          kg2Number: kgList[1],
          primary1Number: primaryList[0],
          primary2Number: primaryList[1],
          primary3Number: primaryList[2],
          primary4Number: primaryList[3],
          primary5Number: primaryList[4],
          primary6Number: primaryList[5],
          perGirlsNumber: perAndSecList[0],
          perBoysNumber: perAndSecList[1],
          secGirlsNumber: perAndSecList[2],
          secBoysNumber: perAndSecList[3],
          studentsNumber: adultsList[0],
          graduatesNumber: adultsList[1],
          peopleNumber: adultsList[2],
          menNumber: adultsList[3],
          servantNubmer: servantList[0],
          sundayServantsNumber: servantList[1],
          prepareServantsNumber: servantList[2],
          mothoerDulajiNumber: someServicesList[0],
          wisdomsNumber: someServicesList[1],
          stageNumber: someServicesList[2],
          demonstrationToolsNumber: someServicesList[3],
          brothersOfLordNumber: someServicesList[4],
          coralsNumber: someOtherServicesList[0],
          festivalCoordinatorsNumber: someOtherServicesList[1],
          scoutsNumber: someOtherServicesList[2],
          counselingCentreNumber: someOtherServicesList[3],
          deaconsSchoolNumber: someOtherServicesList[4],
        );
        //generating pdf methode
        final pdfFile = await ApiPdfForSupervisor.generate(invoice);
        //open file methode
        ApiPdfForSupervisor.openfile(pdfFile);
        EasyLoading.dismiss();
      } catch (e) {
        errorOnCreatingFile(
            message: ' حدث خطاء اثناء انشاء الفايل رجاء اعادة المحاولة ');
      }
    } else {
      errorOnCreatingFile(
          message:
              'حدث خطأ اثناء جلب بياناتك الشخصية رجاء محبة المحاولة مرة اخري');
    }
  }
}
