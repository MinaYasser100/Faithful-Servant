import 'package:faithful_servant/features/forgotten_password/presentation/views/forgotten_password.dart';
import 'package:faithful_servant/features/general_manager/presentation/views/general_manager_screen.dart';
import 'package:faithful_servant/features/login/presentation/views/login_view.dart';
import 'package:faithful_servant/features/mine_servant/presentation/views/mine_servant_screen.dart';
import 'package:faithful_servant/features/register/presentation/views/register_view.dart';
import 'package:faithful_servant/features/splash_view/views/presentation/splash_view.dart';
import 'package:faithful_servant/features/welcome_view/presentation/views/welcome_view.dart';
import 'package:get/get.dart';

abstract class GetPages {
  static String kSplashView = '/SplashView';
  static String kWelcomeView = '/WelcomeView';
  static String kLoginView = '/LoginView';
  static String kRegisterView = '/RegisterView';
  static String kforgottenPasswordView = '/forgottenPasswordView';
  static String generalManager = '/generalManager';
  static String mineServant = '/MineServant';

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
      name: kforgottenPasswordView,
      page: () => const ForgottenPasswordView(),
      transition: Transition.circularReveal,
    ),
  ];
}
