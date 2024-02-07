import 'package:faithful_servant/features/statistics/data/Models/pdf_feature_modes/piechart_count_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../../../../../core/helper/constant.dart';

class Pdfbody {
  static MultiPage pdfBody(Font regularFont, DataPathsToPdf data) {
    return MultiPage(
      textDirection: TextDirection.rtl,
      theme: ThemeData.withFont(base: regularFont),
      footer: (context) {
        return pIeChartCountFooterPdf(data);
      },
      header: (context) {
        return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text('الاسم: ${data.name}'),
          Text('الخدمة : ${data.service}'),
          Text('الدور : ${data.role}')
        ]);
      },
      pageFormat: PdfPageFormat.a4, // setting the page size
      build: (context) => [
        SizedBox(height: 30),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            data.statisticTitle,
            style: TextStyle(color: kPdfPrimaryColor, fontSize: 25),
          ),
        ]),
        SizedBox(height: 8),
        buildTable(data),
      ],
    );
  }

  static Row pIeChartCountFooterPdf(DataPathsToPdf data) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(data.churchName), // should be dynamicaly
      Text('تاريخ الطباعة : ${data.date}')
    ]);
  }

  static Widget buildTable(DataPathsToPdf data) {
    List heardersList = [
      'الخدمات',
      'ذكر',
      'انثي',
    ];

    return Table.fromTextArray(
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
        [data.service, data.malecount, data.femalecount]
      ],
    );
  }
}
