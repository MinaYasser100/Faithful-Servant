import 'dart:io';
import 'package:faithful_servant/features/statistics/presentation/views/widgets/printing_feature/pdf_body.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import '../Models/pdf_feature_modes/piechart_count_model.dart';

class PdfApi {
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

  static Future<File> generate(DataPathsToPdf dataPathsToPdf) async {
    final regularFont =
        Font.ttf(await rootBundle.load("assets/fonts/Cairo-Bold.ttf"));
    final pdf = Document();
    pdf.addPage(Pdfbody.pdfBody(regularFont, dataPathsToPdf));
    return PdfApi.savePDF(pdf: pdf, name: 'My_Pdf.pdf');
  }
}
