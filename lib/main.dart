import 'package:faithful_servant/core/helper/cache_helper.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/helper/local/app_locale.dart';
import 'package:faithful_servant/core/helper/local/locale_controller.dart';
import 'package:faithful_servant/core/widgets/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalController appLocalController = Get.put(AppLocalController());
    return GetMaterialApp(
      locale: appLocalController.initilalLanguage,
      translations: Applocal(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: true,
        textTheme: GoogleFonts.cairoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: GetPages.kSplashView,
      getPages: GetPages.getPages,
      builder: EasyLoading.init(),
    );
  }
}
