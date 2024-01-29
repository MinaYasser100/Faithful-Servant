import 'package:faithful_servant/features/splash_view/views/presentation/splash_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

abstract class GetPages {
  static String kSplashView = '/SplashView';
  static List<GetPage<dynamic>> getPages = [
    GetPage(
      name: kSplashView,
      page: () => const SplashView(),
    )
  ];
}
