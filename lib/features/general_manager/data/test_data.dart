import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:flutter/material.dart';

class Testdb {
  List<Map> db = [
    {
      'name': "kirolos adel boctor",
      'address_Area': "ش عبدالله رفاعي",
      'address_Street_Name': 'ش ابو بكر محمد السيد',
      'address_Home_Num': 5,
      'phoneNum1': '01126198158',
      'phoneNum2': '01200602318',
      'qualifications': "بكالريوس هندسة كهرباء",
      'church_code': 1256,
      'current_service': "اولي ابتدائي",
      'current_role': 'خادم',
      'privilege': 3, // 1 : abona, 2 : امين الخدمة
    },
    {
      'name': "abanob adel boctor",
      'address_Area': "ش عبدالله رفاعي",
      'address_Street_Name': 'ش ابو بكر محمد السيد',
      'address_Home_Num': 5,
      'phoneNum1': '01126198158',
      'phoneNum2': '01200602318',
      'qualifications': "بكالريوس هندسة كهرباء",
      'church_code': 1256,
      'current_service': "ثانوي بنين",
      'current_role': 'خادم',
      'privilege': 1, // 1 : abona, 2 : امين الخدمة
    },
    {
      'name': "Ebram adel boctor",
      'address_Area': "ش عبدالله رفاعي",
      'address_Street_Name': 'ش ابو بكر محمد السيد',
      'address_Home_Num': 5,
      'phoneNum1': '01126198158',
      'phoneNum2': '01200602318',
      'qualifications': "بكالريوس هندسة كهرباء",
      'church_code': 1256,
      'current_service': "اعدادي بنين",
      'current_role': 'خادم',
      'privilege': 2, // 1 : abona, 2 : امين الخدمة
    },
  ];

  List<Map> pages = [
    {
      'text': 'خدام المرحلة',
      "btntext": 'Open',
      'routeto': GetPages.MineServant,
      'icon': Icons.abc_outlined,
    },
    {
      'text': 'احصائيات',
      "btntext": 'Open',
      'routeto': GetPages.MineServant,
      'icon': Icons.line_axis,
    },
  ];
}
