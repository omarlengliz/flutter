import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:ktebbi/bindings/initialBindings.dart';
import 'package:ktebbi/controller/dependcy_injection.dart';
import 'package:ktebbi/core/Theme/Theme.dart';

import 'package:ktebbi/core/localisation/changeLocale.dart';
import 'package:ktebbi/core/localisation/translation.dart';
import 'package:ktebbi/core/services/services.dart';
import 'package:ktebbi/firebase_options.dart';
import 'package:ktebbi/routes.dart';
import 'package:ktebbi/utils/theme/theme.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    Gemini.init(apiKey: 'AIzaSyDZKAbD72zX360Brb8Y7j1mo0Blc6wuQeQ');
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
Future<void> handleOnMessage(RemoteMessage message) async {
  print("onBackgroundMessage: $message");
}
await FirebaseMessaging.instance.requestPermission(
  alert: true,
  badge: true,
  provisional: true,
  carPlay: true,
  criticalAlert: true,
  sound: true,


) ; 
FirebaseMessaging.onBackgroundMessage(handleOnMessage) ; 
FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  });
FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('A new onMessageOpenedApp event was published!');
  });
FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  alert: true,
  badge: true,
  sound: true,
);

  await initialService() ; 
  DependencyInjection.init(); 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController()) ;
    ThemeController themeController = Get.put(ThemeController()) ;

    return GetMaterialApp(
       themeMode: themeController.getThemeMode(),
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      translations: MyTranslations(),
      locale: controller.language,
      title: 'Flutter Demo',
      initialBinding: InitialBinding(),
      // home:  MapScreen(),
      getPages: routes,
    );
  }
}
