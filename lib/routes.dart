import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ktebbi/core/constants/routes.dart';
import 'package:ktebbi/core/middlewares/middleware.dart';
import 'package:ktebbi/views/screens/BookDetails.dart';
import 'package:ktebbi/views/screens/SplashScreen.dart';
import 'package:ktebbi/views/screens/auth/login.dart';
import 'package:ktebbi/views/screens/auth/register.dart';
import 'package:ktebbi/views/screens/auth/verifyCode.dart';
import 'package:ktebbi/views/screens/auth/verifyEmail.dart';
import 'package:ktebbi/views/screens/language.dart';
import 'package:ktebbi/views/screens/onboarding.dart';
import 'package:ktebbi/views/screens/readPage.dart';
import 'package:ktebbi/views/widgets/navigationMenu.dart';


List<GetPage<dynamic>>? routes = [

  GetPage(name: "/", page: () => const SplashScreen() ),
  GetPage(name: "/first", page: () => const Language() , middlewares: [
    MyMiddleWare()
  ]),

  GetPage(name: AppRoute.onBoarding, page: () => const Onboarding()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.home, page: () => const NavigationMenu ()),
  GetPage(name: AppRoute.sendCode, page: () => const VerifyEmail()),
  GetPage(name: AppRoute.verifyEmail, page: ()=> const VerifyCode()) , 
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.bookDetails, page: () => const BookDetails()),
  GetPage(name: AppRoute.read, page: () => const ReadPage()),

]  ; 
 