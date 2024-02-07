import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/core/function/getting_day_date.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/error_aleart_dialog.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../data/Models/pdf_feature_modes/piechart_count_model.dart';
import '../../../../data/pdf_feature/pdf_api.dart';

void piechartCountPrint() async {
  EasyLoading.show(
    status: 'Loading...'.tr,
  );
  UserModel? userModel = await getUserData();
  if (userModel != null) {
    try {
      DataPathsToPdf invoice = DataPathsToPdf(
          date: gettingDayDate(),
          role: 'امين خدمة',
          statisticTitle: 'اعداد خدام الخدمة',
          femalecount: 50,
          malecount: 20,
          name: userModel.name,
          service: userModel.currentService,
          churchName: churchNamesBasedOnCode[userModel.church]);
      //generating pdf methode
      final pdfFile = await PdfApi.generate(invoice);
      //open file methode
      PdfApi.openfile(pdfFile);
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
