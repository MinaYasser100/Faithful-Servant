import "package:faithful_servant/core/helper/get_pages.dart";
import "package:flutter/material.dart";

const kPrimaryColor = Color(0xff042c5c);
const kSecondColor = Color(0xffebeff6);
const kTextGreyColor = Color.fromARGB(255, 135, 137, 137);
const kPrimaryLightColor = Color(0xff2879fe);
const kDarkSecondColor = Color(0xff77869e);
const saintGeorge = 'مار جرجس و الانباء بيشوي';
const virginMary = 'العدراء و مار مينا العجايبي';
const saintMark = 'مار مرقس و ابو سيفين';
const saintMain = 'مار مينا و البابا كيرلس';
Map<String, dynamic> selectChurch = {
  saintGeorge: 'G&B123marg',
  virginMary: 'M&M455marg',
  saintMark: 'M&F677marg',
  saintMain: 'M&K&K234mo',
};
double bodyRadious = 30.0;

List<Map> pages = [
  {
    'Privileges': '2',
    'text': 'خدام المرحلة',
    "btntext": 'Open',
    'routeto': GetPages.mineServant,
    'icon': Icons.abc_outlined,
  },
  {
    'Privileges': '3',
    'text': 'خدام المرحلة',
    "btntext": 'Open',
    'routeto': GetPages.mineServant,
    'icon': Icons.abc_outlined,
  },
  {
    'Privileges': '2',
    'text': 'احصائيات',
    "btntext": 'Open',
    'routeto': GetPages.statistics,
    'icon': Icons.line_axis,
  },
  {
    'Privileges': '3',
    'text': 'احصائيات',
    "btntext": 'Open',
    'routeto': GetPages.statistics,
    'icon': Icons.line_axis,
  },
];

List pagesafterfilter = pages.where((i) => i['Privileges'] == '3').toList();
