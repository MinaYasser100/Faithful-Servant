import 'package:faithful_servant/features/general_supervisor/presentation/views/select_stageView.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/add_ma5domeenView.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/ma5domeen_view.dart';
import 'package:get/get.dart';

import '../../features/Attendance&others/presentaion/views/attendance_other_view.dart';
import '../../features/feudal_custodian/feual_custodian_view/presentaion/views/feudal_custodian_view.dart';
import '../../features/forgotten_password/presentation/views/forgotten_password.dart';
import '../../features/general_manager/presentation/views/general_manager_screen.dart';
import '../../features/general_supervisor/presentation/views/general_supervisor.dart';
import '../../features/general_supervisor_screens/supervisor_statistic/presentation/views/supervisor_statistics_view.dart';
import '../../features/general_supervisor_screens/users_requests/presentation/views/users_requests_view.dart';
import '../../features/login/presentation/views/login_view.dart';
import '../../features/mine_servant/presentation/views/mine_servant_screen.dart';
import '../../features/modifie_informations/presentation/views/modifie_informations_view.dart';
import '../../features/notification/presentaion/views/notifications_view.dart';
import '../../features/personal/presentation/views/history_view.dart';
import '../../features/personal/presentation/views/personal_view.dart';
import '../../features/register/presentation/views/register_view.dart';
import '../../features/servant/presentation/views/servant_view.dart';
import '../../features/setting_language/presentation/views/setting_language_view.dart';
import '../../features/splash_view/views/presentation/splash_view.dart';
import '../../features/statistics/presentation/views/statistics_screen.dart';
import '../../features/user_informations/presentation/views/user_informations_view.dart';
import '../../features/welcome_view/presentation/views/welcome_view.dart';

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
  static String kFeudalCustodianView = '/feudalCustodianView';
  static String kUserRequestsView = '/userRequestsView';
  static String generalManager = '/generalManager';
  static String mineServant = '/MineServant';
  static String statistics = '/statistics';
  static String attendaceAndOthers = '/attendanceAndOthers';
  static String personalview = '/personalview';
  static String history = '/history';
  static String notification = '/notification';
   static String selectStageview = '/selectStageview';
   static String ma5domeenView = '/sMa5domeenView';
   static String addMa5domeenview = '/addMa5domeenview';
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
    GetPage(
      name: kFeudalCustodianView,
      page: () => const FeudalCustodianView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kUserRequestsView,
      page: () => const UsersRequestsView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: selectStageview,
      page: () => const SelectStageview(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: ma5domeenView,
      page: () => const Ma5domeenView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: addMa5domeenview,
      page: () => const AddMa5domeenview(),
      transition: Transition.circularReveal,
    ),
  ];
}
