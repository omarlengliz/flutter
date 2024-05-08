

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/core/services/services.dart';

abstract class LogoutController extends GetxController {
  logout();
 
}

class LogoutControllerImp extends LogoutController {
    MyServices myServices = Get.find() ;
    StatusRequest? statusRequest;

  @override
  logout() async {
    statusRequest = StatusRequest.loading;
    update();
    await Future.delayed(Duration(seconds: 1));

    await myServices.sharedPreferences.setString("step" , "1")  ;
    await myServices.sharedPreferences.remove("user")  ;

    Get.offAllNamed("/login")  ;

  }
}