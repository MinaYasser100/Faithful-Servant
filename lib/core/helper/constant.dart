import "package:faithful_servant/core/helper/get_pages.dart";
import "package:flutter/material.dart";
import "package:pdf/pdf.dart";

const kPrimaryColor = Color(0xff042c5c);
PdfColor kPdfPrimaryColor = PdfColor.fromHex('042c5c');
const kSecondColor = Color(0xffebeff6);
const kTextGreyColor = Color.fromARGB(255, 135, 137, 137);
const kPrimaryLightColor = Color(0xff2879fe);
const kDarkSecondColor = Color(0xff77869e);
const saintGeorge = 'مار جرجس و الانباء بيشوي';
const virginMary = 'العدراء و مار مينا العجايبي';
const saintMark = 'مار مرقس و ابو سيفين';
const saintMain = 'مار مينا و البابا كيرلس';
const kUserBox = 'user_box';
Map<String, dynamic> selectChurch = {
  saintGeorge: 'G&B123marg',
  virginMary: 'M&M455marg',
  saintMark: 'M&F677marg',
  saintMain: 'M&K&K234mo',
};
Map<String, dynamic> churchNamesBasedOnCode = {
  'G&B123marg': saintGeorge,
  'M&M455marg': virginMary,
  'M&F677marg': saintMark,
  'M&K&K234mo': saintMain,
};

final List<String> currentServiceItems = [
  'حضانة كيجي 1',
  'حضانة كيجي 2',
  'اولي ابتدائي',
  'ثانية ابتدائي',
  'ثالثة ابتدائي',
  'رابعة ابتدائي',
  'خامسة ابتدائي',
  'سادسة ابتدائي',
  'اعدادي بنين',
  'اعدادي بنات',
  'ثانوي بنين',
  'ثانوي بنات',
  'جامعيين',
  'خريجين',
  'الشعب',
  'اجتماع الرجال',
  'اجتماع الخدام',
  'مدارس احد يوم الاحد',
  'عداد خدام',
  'الام دولاجي',
  'الحكيمات',
  'المسرح',
  'وسائل الايضاح',
  'اخوة الرب',
  'الكورالات',
  'منسقين المهرجان',
  'الكشافة',
  'مركز المشورة',
  'مدرسة الشمامسة',
  'كاهن',
];

const kUserId = 'userId';
String? userToken;

const languageKey = 'language';

const kHomeView = 'homeView';

double bodyRadious = 30.0;

List<Map> generalServantPage = [
  {
    'text': 'خدام المرحلة',
    "btntext": 'Open',
    'routeto': GetPages.mineServant,
    'icon': Icons.abc_outlined,
  },
  {
    'text': 'احصائيات',
    "btntext": 'Open',
    'routeto': GetPages.statistics,
    'icon': Icons.line_axis,
  },
  {
    'text': 'المتابعة',
    "btntext": 'Open',
    'routeto': GetPages.attendaceAndOthers,
    'icon': Icons.edit_document,
  },
  {
    'text': 'بياناتك',
    "btntext": 'Open',
    'routeto': GetPages.kUserInformationsView,
    'icon': Icons.article_outlined,
  },
];

List<Map> genetalSuperVisorPages = [
  {
    'text': 'خدام المرحلة',
    "btntext": 'Open',
    'routeto': GetPages.mineServant,
    'icon': Icons.abc_outlined,
  },
  {
    'text': 'احصائيات',
    "btntext": 'Open',
    'routeto': GetPages.kSupervisorStatisticsView,
    'icon': Icons.line_axis,
  },
  {
    'text': 'بياناتك',
    "btntext": 'Open',
    'routeto': GetPages.kUserInformationsView,
    'icon': Icons.article_outlined,
  },
];

List<Map> servantPages = [
  {
    'text': 'بياناتك',
    "btntext": 'Open',
    'routeto': GetPages.kUserInformationsView,
    'icon': Icons.article_outlined,
  },
];

List<Map> personalPages = [
  {
    "title": 'البيانات الشخصية',
    "icon": const Icon(Icons.abc),
    'routto': GetPages.kUserInformationsView
  },
  {
    "title": 'تاريخي الخدمي',
    "icon": const Icon(Icons.ac_unit_outlined),
    'routto': GetPages.history
  },
  {"title": 'تسجيل الخروج', "icon": const Icon(Icons.logout), 'routto': ''},
];

List<String> placesItems = [
  'كنيسة مارجرجس',
  'اخري',
];

String selectedservice = 'جامعيين';
String selectedplace = 'كنيسة مارجرجس';

List<String> currentrolesItems = ['المشرف العام', 'امين الخدمة', 'خادم'];

late String initialservice;
late String initialrole;
late String initialduration;
late String initialplace;
late String initialplaceelse;
