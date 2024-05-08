import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:ktebbi/bindings/initialBindings.dart';
import 'package:ktebbi/controller/dependcy_injection.dart';
import 'package:ktebbi/core/Theme/Theme.dart';
import 'package:ktebbi/core/class/crud.dart';

import 'package:ktebbi/core/localisation/changeLocale.dart';
import 'package:ktebbi/core/localisation/translation.dart';
import 'package:ktebbi/core/services/services.dart';
import 'package:ktebbi/firebase_options.dart';
import 'package:ktebbi/routes.dart';
import 'package:ktebbi/utils/theme/theme.dart';
import 'package:ktebbi/views/screens/BookDetails.dart';
import 'package:ktebbi/views/screens/Home.dart';
import 'package:ktebbi/views/screens/WishList.dart';
import 'package:ktebbi/views/screens/auth/verifyCode.dart';
import 'package:ktebbi/views/screens/auth/verifyEmail.dart';
import 'package:ktebbi/views/screens/language.dart';
import 'package:ktebbi/views/screens/settings.dart';
import 'package:ktebbi/views/screens/test.dart';
import 'package:ktebbi/views/widgets/navigationMenu.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    Gemini.init(apiKey: 'AIzaSyDZKAbD72zX360Brb8Y7j1mo0Blc6wuQeQ');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
      // home: const NavigationMenu(),
      getPages: routes,
    );
  }
}
