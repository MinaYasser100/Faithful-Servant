import 'package:faithful_servant/features/all_servants/presentation/views/all_servants_views.dart';
import 'package:faithful_servant/features/all_servants/presentation/views/widgets/all_servant_for_general_servant.dart';
import 'package:faithful_servant/features/all_servants/presentation/views/widgets/all_servants_for_state.dart';
import 'package:faithful_servant/features/general_supervisor/presentation/views/select_stage_view.dart';
import 'package:faithful_servant/features/login/confirm_validity/presentation/views/confirm_validity_view.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/add_ma5domeen_view.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/edit_ma5domeen_data_view.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/ma5domeen_details_view.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/ma5domeen_view.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/ma5domeen_view_for_ameen_el2etaa3.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/ma5domeen_view_for_general.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/ma5domeen_view_for_servant.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/search/presentation/views/ma5domeen_search_view.dart';
import 'package:faithful_servant/features/notification/presentation/views/notifications_view.dart';
import 'package:faithful_servant/features/notification/show_notification/presentation/views/show_notification_view.dart';
import 'package:get/get.dart';
import '../../features/Attendance&others/presentaion/views/attendance_other_view.dart';
import '../../features/feudal_custodian/feual_custodian_view/presentaion/views/feudal_custodian_view.dart';
import '../../features/forgotten_password/presentation/views/forgotten_password.dart';
import '../../features/general_manager/presentation/views/general_manager_screen.dart';
import '../../features/general_supervisor/presentation/views/general_supervisor.dart';
import '../../features/general_supervisor_screens/supervisor_statistic/presentation/views/supervisor_statistics_view.dart';
import '../../features/general_supervisor_screens/users_requests/presentation/views/users_requests_view.dart';
import '../../features/general_supervisor_screens/users_requests/user_request_details/change_privilage_or_service/presentation/views/change_privilage_or_service_view.dart';
import '../../features/general_supervisor_screens/users_requests/user_request_details/presentation/views/user_request_details_view.dart';
import '../../features/login/presentation/views/login_view.dart';
import '../../features/mine_servant/presentation/views/mine_servant_screen.dart';
import '../../features/modifie_informations/presentation/views/modifie_informations_view.dart';
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
  static String ma5domeenDetailsView = '/ma5domeenDetailsView';
  static String kMa5domeenSearchView = '/MadomeenSearchView';
  static String kEditMa5domeenDataView = '/EditMa5domeenDataView';
  static String kMa5domeenViewForGeneral = '/Ma5domeenViewForGeneral';
  static String kConfirmValidityView = '/ConfirmValidityView';
  static String kMa5domeenViewForAmeenEl2etaa3 =
      '/Ma5domeenViewForAmeenEl2etaa3';
  static String kMa5domeenViewForServant = '/Ma5domeenViewForServant';
  static String kAllServantsView = '/kAllServantsView';
  static String kAllServantsForStage = '/AllServantsForStage';
  static String kAllServantForGeneralServant = '/AllServantForGeneralServant';
  static String kPersonalInformationsView = '/PersonalInformationsView';
  static String kShowNotificationView = '/ShowNotificationView';
  static String kUserRequestDetailsView = '/UserRequestDetailsView';
  static String kChangePrivilageOrServiceView = '/ChangePrivilageOrServiceView';

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
    GetPage(
      name: ma5domeenDetailsView,
      page: () => const Ma5domeenDetailsView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kMa5domeenSearchView,
      page: () => const Ma5domeenSearchView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kEditMa5domeenDataView,
      page: () => const EditMa5domeenDataView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kMa5domeenViewForGeneral,
      page: () => const Ma5domeenViewForGeneral(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kConfirmValidityView,
      page: () => const ConfirmValidityView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kMa5domeenViewForAmeenEl2etaa3,
      page: () => const Ma5domeenViewForAmeenEl2etaa3(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kMa5domeenViewForServant,
      page: () => const Ma5domeenViewForServant(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kAllServantsView,
      page: () => const AllServantsViews(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kAllServantsForStage,
      page: () => const AllServantsForStage(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kAllServantForGeneralServant,
      page: () => const AllServantForGeneralServant(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kShowNotificationView,
      page: () => const ShowNotificationView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kUserRequestDetailsView,
      page: () => const UserRequestDetailsView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: kChangePrivilageOrServiceView,
      page: () => const ChangePrivilageOrServiceView(),
      transition: Transition.circularReveal,
    ),
  ];
}
