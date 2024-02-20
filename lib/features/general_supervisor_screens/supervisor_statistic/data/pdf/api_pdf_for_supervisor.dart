import 'dart:io';

import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/model/pdf_data_model.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

import '../../presentation/views/function/pdf_supervisor_body.dart';

class ApiPdfForSupervisor {
  static Future<File> savePDF(
      {required Document pdf, required String name}) async {
    // Specify the file path where you want to save the PDF
    final bytes = await pdf.save();
    final dir = await getApplicationCacheDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }

  static Future openfile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }

  static Future<File> generate(PdfDataModel pdfDataModel) async {
    final regularFont =
        Font.ttf(await rootBundle.load("assets/fonts/Cairo-Bold.ttf"));
    final pdf = Document();
    pdf.addPage(PdfSupervisorBody.pdfBody(regularFont, pdfDataModel));
    return ApiPdfForSupervisor.savePDF(pdf: pdf, name: 'My_Pdf.pdf');
  }
}
