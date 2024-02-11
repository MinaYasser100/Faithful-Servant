import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/model/pdf_data_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfSupervisorBody {
  static MultiPage pdfBody(Font regularFont, PdfDataModel data) {
    return MultiPage(
      textDirection: TextDirection.rtl,
      theme: ThemeData.withFont(base: regularFont),
      footer: (context) {
        return pIeChartCountFooterPdf(data);
      },
      header: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('الاسم: ${data.name}'),
            Text('الخدمة : ${data.service}'),
            Text('الدور : ${data.role}')
          ],
        );
      },
      pageFormat: PdfPageFormat.a4, // setting the page size
      build: (context) => [
        SizedBox(height: 30),
        // title of the pdf page
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data.statisticTitle,
              style: TextStyle(color: kPdfPrimaryColor, fontSize: 25),
            ),
          ],
        ),
        SizedBox(height: 8),
        buildTable(data),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildFemaleTable(data),
            buildMaleTable(data),
          ],
        ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 170),
          child: buildTable2(data),
        ),
      ],
    );
  }

  static Row pIeChartCountFooterPdf(PdfDataModel data) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(data.churchName), // should be dynamicaly
      Text('تاريخ الطباعة : ${data.date}')
    ]);
  }

  static Widget buildTable(PdfDataModel data) {
    List heardersList = [
      'عدد الخدام',
      'اسم الخدمة',
    ];

    return TableHelper.fromTextArray(
      headers: heardersList,
      cellAlignment: Alignment.center,
      border: null,
      headerDecoration: const BoxDecoration(
        color: PdfColors.grey300,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      data: [
        [data.kg1Number, 'كيجي 1'],
        [data.kg2Number, 'كيجي 2'],
        [data.primary1Number, 'اولي ابتدائي'],
        [data.primary2Number, 'ثانية ابتدائي'],
        [data.primary3Number, 'ثالثة ابتدائي'],
        [data.primary4Number, 'اربعة ابتدائي'],
        [data.primary5Number, 'خمسة ابتدائي'],
        [data.primary6Number, 'سادسة ابتدائي'],
        [data.perGirlsNumber, 'اعدادية بنات'],
        [data.perBoysNumber, 'اعدادية بنين'],
        [data.secGirlsNumber, 'ثانوية  بنات'],
        [data.secBoysNumber, 'ثانوية  بنين'],
        [data.studentsNumber, 'اجتماع جامعيين'],
        [data.graduatesNumber, 'اجتماع خرجيين'],
        [data.peopleNumber, 'اجتماع الشعب'],
        [data.menNumber, 'اجتماع الرجال'],
        [data.servantNubmer, 'اجتماع الخدام'],
        [data.sundayServantsNumber, 'خدام يوم الحد'],
        [data.prepareServantsNumber, 'اعداد خدام'],
        [data.mothoerDulajiNumber, 'الام دولاجي'],
        [data.wisdomsNumber, 'الحكيمات'],
        [data.stageNumber, 'المسرح'],
        [data.demonstrationToolsNumber, 'وسائل الايضاح'],
        [data.brothersOfLordNumber, 'اخوة الرب'],
        [data.coralsNumber, 'الكورالات'],
        [data.festivalCoordinatorsNumber, 'منسقين المهرجان'],
        [data.scoutsNumber, 'الكشافة'],
        [data.counselingCentreNumber, 'مركز المشورة'],
        [data.deaconsSchoolNumber, 'مدرسة الشمامسة'],
      ],
    );
  }

  static Widget buildTable2(PdfDataModel data) {
    List heardersList = [
      data.malecount + data.femalecount,
      'المجموع الكلي : ',
    ];

    return TableHelper.fromTextArray(
      headers: heardersList,
      cellAlignment: Alignment.center,
      border: null,
      headerDecoration: const BoxDecoration(
        color: PdfColors.grey300,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      data: [],
    );
  }

  static Widget buildFemaleTable(PdfDataModel dataModel) {
    List headersList = [
      dataModel.femalecount,
      'عدد الاناث الخادمات : ',
    ];
    return TableHelper.fromTextArray(
      headers: headersList,
      cellAlignment: Alignment.center,
      border: null,
      headerDecoration: const BoxDecoration(
        color: PdfColors.grey300,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      data: [],
    );
  }

  static Widget buildMaleTable(PdfDataModel dataModel) {
    List headersList = [
      dataModel.femalecount,
      'عدد الخدام الذكور : ',
    ];
    return TableHelper.fromTextArray(
      headers: headersList,
      cellAlignment: Alignment.center,
      border: null,
      headerDecoration: const BoxDecoration(
        color: PdfColors.grey300,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      data: [],
    );
  }
}
