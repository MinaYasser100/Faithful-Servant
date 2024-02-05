import 'package:faithful_servant/features/forgotten_password/presentation/views/forgotten_password.dart';
import 'package:faithful_servant/features/general_manager/presentation/views/general_manager_screen.dart';
import 'package:faithful_servant/features/general_supervisor/presentation/views/general_supervisor.dart';
import 'package:faithful_servant/features/login/presentation/views/login_view.dart';
import 'package:faithful_servant/features/mine_servant/presentation/views/mine_servant_screen.dart';
import 'package:faithful_servant/features/register/presentation/views/register_view.dart';
import 'package:faithful_servant/features/servant/presentation/views/servant_view.dart';
import 'package:faithful_servant/features/setting_language/presentation/views/setting_language_view.dart';
import 'package:faithful_servant/features/splash_view/views/presentation/splash_view.dart';
import 'package:faithful_servant/features/statistics/presentation/views/statistics_screen.dart';
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
  static String generalManager = '/generalManager';
  static String mineServant = '/MineServant';
  static String statistics = '/statistics';
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
  ];
}
