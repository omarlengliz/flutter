import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController
{

  @override
  void onInit() {
    super.onInit();
  }
  
  goToMain() {
    Get.toNamed("/first") ; 
  }
}
