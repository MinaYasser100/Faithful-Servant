import 'package:faithful_servant/core/function/screen_action/determined_initial_route.dart';
import 'package:faithful_servant/core/helper/cache_helper.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/helper/local/app_locale.dart';
import 'package:faithful_servant/core/helper/local/locale_controller.dart';
import 'package:faithful_servant/core/model/notification_model/notification_model.dart';
import 'package:faithful_servant/core/widgets/bloc_observer.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  Bloc.observer = SimpleBlocObserver();
  await CacheHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    await Firebase.initializeApp();
    // Register the adapter if not already registered
    if (!Hive.isAdapterRegistered(NotificationModelAdapter().typeId)) {
      Hive.registerAdapter(NotificationModelAdapter());
    }
    var box = Hive.isBoxOpen(kNotificationBoxKey)
        ? Hive.box(kNotificationBoxKey)
        : await Hive.openBox(kNotificationBoxKey);
    _saveNotificationToHive(message, box);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    await Firebase.initializeApp();
    // Register the adapter if not already registered
    if (!Hive.isAdapterRegistered(NotificationModelAdapter().typeId)) {
      Hive.registerAdapter(NotificationModelAdapter());
    }

    // Open the Hive box if not already open
    var box = Hive.isBoxOpen(kNotificationBoxKey)
        ? Hive.box(kNotificationBoxKey)
        : await Hive.openBox(kNotificationBoxKey);
    _saveNotificationToHive(message, box);
  });
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
      initialRoute: determinedInitialRoute(),
      getPages: GetPages.getPages,
      builder: EasyLoading.init(),
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await Hive.initFlutter();

  // Register the adapter if not already registered
  if (!Hive.isAdapterRegistered(NotificationModelAdapter().typeId)) {
    Hive.registerAdapter(NotificationModelAdapter());
  }

  // Open the Hive box if not already open
  var box = Hive.isBoxOpen(kNotificationBoxKey)
      ? Hive.box(kNotificationBoxKey)
      : await Hive.openBox(kNotificationBoxKey);

  if (message.notification != null) {
    _saveNotificationToHive(message, box);
  }
}

void _saveNotificationToHive(RemoteMessage message, Box box) async {
  NotificationModel notification = NotificationModel(
    title: message.notification?.title,
    body: message.notification?.body,
    receivedAt: DateTime.now().toString(),
    readed: false,
    key: message.messageId,
  );
  box.put(notification.key, notification);
}
