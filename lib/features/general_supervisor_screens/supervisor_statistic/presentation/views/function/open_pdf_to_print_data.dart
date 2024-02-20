import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/core/function/getting_day_date.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/error_aleart_dialog.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/model/pdf_data_model.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/pdf/api_pdf_for_supervisor.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

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
        femalecount: 6,
        malecount: 9,
        name: userModel.name,
        service: userModel.currentService,
        churchName: churchNamesBasedOnCode[userModel.church],
        kg1Number: 0,
        kg2Number: 2,
        primary1Number: 1,
        primary2Number: 3,
        primary3Number: 4,
        primary4Number: 8,
        primary5Number: 4,
        primary6Number: 12,
        perGirlsNumber: 4,
        perBoysNumber: 34,
        secGirlsNumber: 15,
        secBoysNumber: 7,
        studentsNumber: 9,
        graduatesNumber: 18,
        peopleNumber: 20,
        menNumber: 24,
        servantNubmer: 24,
        sundayServantsNumber: 21,
        prepareServantsNumber: 29,
        mothoerDulajiNumber: 2,
        wisdomsNumber: 23,
        stageNumber: 25,
        demonstrationToolsNumber: 16,
        brothersOfLordNumber: 34,
        coralsNumber: 21,
        festivalCoordinatorsNumber: 13,
        scoutsNumber: 10,
        counselingCentreNumber: 20,
        deaconsSchoolNumber: 27,
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
