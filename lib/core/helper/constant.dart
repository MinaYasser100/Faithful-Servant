import "package:faithful_servant/core/helper/get_pages.dart";
import "package:faithful_servant/features/register/data/model/user_model.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
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
const kNotificationBoxKey = 'NotificationBox';

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
  'اعداد خدام',
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
List<UserModel> searchServantList = [];
List<UserModel> searchServantListSearchResult = [];

List<Map> generalServantPage = [
  {
    'text': "اشعاراتي",
    "btntext": 'Open',
    'routeto': GetPages.kShowNotificationView,
    'icon': Icons.notifications_active,
  },
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
  {
    'text': "بيانات المخدومين",
    "btntext": 'Open',
    'routeto': GetPages.kMa5domeenViewForGeneral,
    'icon': Icons.article_outlined,
  },
  {
    'text': "بيانات الخدام",
    "btntext": 'Open',
    'routeto': GetPages.kAllServantForGeneralServant,
    'icon': Icons.article_outlined,
  },
];

List<Map> genetalSuperVisorPages = [
  {
    'text': "اشعاراتي",
    "btntext": 'Open',
    'routeto': GetPages.kShowNotificationView,
    'icon': Icons.notifications_active,
  },
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
  {
    'text': "بيانات المخدومين",
    "btntext": 'Open',
    'routeto': GetPages.selectStageview,
    'icon': Icons.article_outlined,
  },
  {
    'text': "بيانات الخدام",
    "btntext": 'Open',
    'routeto': GetPages.kAllServantsView,
    'icon': Icons.article_outlined,
  },
  {
    'text': "طلبات الخدام",
    "btntext": 'Open',
    'routeto': GetPages.kUserRequestsView,
    'icon': Icons.article_outlined,
  },
];

List<Map> servantPages = [
  {
    'text': "اشعاراتي",
    "btntext": 'Open',
    'routeto': GetPages.kShowNotificationView,
    'icon': Icons.notifications_active,
  },
  {
    'text': 'بياناتك',
    "btntext": 'Open',
    'routeto': GetPages.kUserInformationsView,
    'icon': Icons.article_outlined,
  },
  {
    'text': "بيانات المخدومين",
    "btntext": 'Open',
    'routeto': GetPages.kMa5domeenViewForServant,
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
  {
    "title": 'Delete account'.tr,
    "icon": const Icon(Icons.delete_rounded),
    'routto': 'Delete account',
  },
];

List<Map> feudalCustodinPages = [
  {
    'text': "اشعاراتي",
    "btntext": 'Open',
    'routeto': GetPages.kShowNotificationView,
    'icon': Icons.notifications_active,
  },
  {
    'text': 'بياناتك',
    "btntext": 'Open',
    'routeto': GetPages.kUserInformationsView,
    'icon': Icons.article_outlined,
  },
  {
    'text': 'خدام المرحلة',
    "btntext": 'Open',
    'routeto': GetPages.mineServant,
    'icon': Icons.abc_outlined,
  },
  {
    'text': "بيانات الخدام",
    "btntext": 'Open',
    'routeto': GetPages.kAllServantForGeneralServant,
    'icon': Icons.article_outlined,
  },
  {
    'text': "بيانات المخدومين",
    "btntext": 'Open',
    'routeto': GetPages.kMa5domeenViewForAmeenEl2etaa3,
    'icon': Icons.article_outlined,
  },
];

List<String> placesItems = [
  'كنيسة مارجرجس',
  'اخري',
];

String selectedservice = 'جامعيين';
String selectedrole = 'خادم';
String selectedplace = 'كنيسة مارجرجس';

List<String> currentrolesItems = ['المشرف العام', 'امين الخدمة', 'خادم'];

late String initialservice;
late String initialrole;
late String initialduration;
late String initialplace;
late String initialplaceelse;

List<String> sectors = [
  'ابتدائي',
  'اعدادي و ثانوي',
  'خدام و اعداد خدام',
  'شباب',
  'مدرسة الشمامسة',
  'الشعب',
  'الأنشطة',
];

final List<String> current = [
  'حضانة كيجي 1',
  'حضانة كيجي 2',
  'اولي ابتدائي',
  'ثانية ابتدائي',
  'ثالثة ابتدائي',
  'رابعة ابتدائي',
  'خامسة ابتدائي',
  'سادسة ابتدائي',
];

final Map<String, String> userTopics = {
  'الكل': 'all',
  'حضانة كيجي 1': 'KG1',
  'حضانة كيجي 2': 'KG2',
  'اولي ابتدائي': 'firstPrimary',
  'ثانية ابتدائي': 'secondPrimary',
  'ثالثة ابتدائي': 'threePrimary',
  'رابعة ابتدائي': 'fourthPrimary',
  'خامسة ابتدائي': 'fifthPrimary',
  'سادسة ابتدائي': 'sixthPrimary',
  'اعدادي بنين': "adadadBenin",
  'اعدادي بنات': 'adadadBnat',
  'ثانوي بنين': 'secondaryBenin',
  'ثانوي بنات': 'secondaryBant',
  'جامعيين': 'university',
  'خريجين': 'graduates',
  'الشعب': 'people',
  'اجتماع الرجال': 'men\'sMeeting',
  'اجتماع الخدام': 'servants\'sMeeting',
  'مدارس احد يوم الاحد': 'sundaySchool',
  'اعداد خدام': 'preparationServant',
  'الام دولاجي': 'motherDolaji',
  'الحكيمات': 'theWise',
  'المسرح': 'theater',
  'وسائل الايضاح': 'visualAdis',
  'اخوة الرب': 'borthersOfGod',
  'الكورالات': 'theChoirs',
  'منسقين المهرجان': 'festivalCoordinators',
  'الكشافة': 'scouts',
  'مركز المشورة': 'counselingCneter',
  'مدرسة الشمامسة': 'deaconsSchool',
  'كاهن': 'priest',
  'ابتدائي': 'primary',
  'أعدادي': 'preparatory',
  'ثانوي': 'secondary',
  'اعدادي و ثانوي': 'perpartory&secondary',
  'شباب': 'youths',
  'خدام و اعداد خدام': 'servant&preparationServant',
  'مرحلة كيجي': "KG",
  'الأنشطة': 'activities',
};
