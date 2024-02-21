import 'package:faithful_servant/features/Attendance&others/presentaion/views/attendance_other_view.dart';
import 'package:faithful_servant/features/forgotten_password/presentation/views/forgotten_password.dart';
import 'package:faithful_servant/features/general_manager/presentation/views/general_manager_screen.dart';
import 'package:faithful_servant/features/general_supervisor/presentation/views/general_supervisor.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/presentation/views/supervisor_statistics_view.dart';
import 'package:faithful_servant/features/login/presentation/views/login_view.dart';
import 'package:faithful_servant/features/mine_servant/presentation/views/mine_servant_screen.dart';
import 'package:faithful_servant/features/modifie_informations/presentation/views/modifie_informations_view.dart';
import 'package:faithful_servant/features/notification/presentaion/views/notifications_view.dart';
import 'package:faithful_servant/features/personal/presentation/views/history_view.dart';
import 'package:faithful_servant/features/personal/presentation/views/personal_view.dart';
import 'package:faithful_servant/features/register/presentation/views/register_view.dart';
import 'package:faithful_servant/features/servant/presentation/views/servant_view.dart';
import 'package:faithful_servant/features/setting_language/presentation/views/setting_language_view.dart';
import 'package:faithful_servant/features/splash_view/views/presentation/splash_view.dart';
import 'package:faithful_servant/features/statistics/presentation/views/statistics_screen.dart';
import 'package:faithful_servant/features/user_informations/presentation/views/user_informations_view.dart';
import 'package:faithful_servant/features/welcome_view/presentation/views/welcome_view.dart';
import 'package:get/get.dart';

abstract class GetPages {
  static String kSplashView = '/SplashView';
  static String kWelcomeView = '/WelcomeView';
  static String kLoginView = '/LoginView';
  static String kRegisterView = '/RegisterView';
  static String kforgottenPasswordView = '/forgottenPasswordView';
  static String kSettingLanguageView = '/SettingLanguageView';
  static String kGeneralSupervisor = '/generalSupervisor';
  static String kServantView = '/servantview';
  static String kSupervisorStatisticsView = '/supervisorStatisticsView';
  static String kUserInformationsView = '/userInformationsView';
  static String kModifieInformationsView = '/modifieInformationview';
  static String generalManager = '/generalManager';
  static String mineServant = '/MineServant';
  static String statistics = '/statistics';
  static String attendaceAndOthers = '/attendanceAndOthers';
  static String personalview = '/personalview';
  static String history = '/history';
  static String notification = '/notification';
  static List<GetPage<dynamic>> getPages = [
    GetPage(
      name: kSplashView,
      page: () => const SplashView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kWelcomeView,
      page: () => const WelcomeView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kLoginView,
      page: () => const LoginView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kRegisterView,
      page: () => const RegisterView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: generalManager,
      page: () => const GeneralManager(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: mineServant,
      page: () => const MineServant(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: statistics,
      page: () => const Statistics(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kforgottenPasswordView,
      page: () => const ForgottenPasswordView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kSettingLanguageView,
      page: () => const SettinLanguagegView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kGeneralSupervisor,
      page: () => const GeneralSuperVisor(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kServantView,
      page: () => const ServantView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kSupervisorStatisticsView,
      page: () => const SupervisorStatisticsView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: attendaceAndOthers,
      page: () => const AttendanceAndOther(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: personalview,
      page: () => const PersonalView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: history,
      page: () => const HistoryView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: notification,
      page: () => const NotificationView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kUserInformationsView,
      page: () => const UserInformationsView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kModifieInformationsView,
      page: () => ModifieInformationsView(),
      transition: Transition.circularReveal,
    ),
  ];
}
