import 'package:get/get.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/core/constants/routes.dart';
import 'package:ktebbi/core/functions/handlingData.dart';
import "package:http/http.dart" as http;
import 'package:ktebbi/linkapi.dart';

abstract class SendVerificationCodeController extends GetxController {
  sendVerificationCode();
  goToVerify() ; 
}

class SendVerificationCodeControllerImpl
    extends SendVerificationCodeController {
  StatusRequest? statusRequest;
  String? email;

  @override
  sendVerificationCode() async {
    statusRequest = StatusRequest.loading;
    update();
    final res = http.post(Uri.parse(AppLink.sendVerificationCode) , body: {
      "email" : email 
    }); 
    
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (statusRequest==StatusRequest.success) {
        
      } 
    }else {
        Get.defaultDialog(title: "Warning", middleText: "Something went wrong!");
        statusRequest = StatusRequest.failure;
      }
    update();
  }

  @override
  void onInit() {
    email=Get.arguments["email"] ; 
    
    sendVerificationCode();
    super.onInit();
  }
  
  @override
  goToVerify() {
    Get.toNamed(AppRoute.verifyEmail, arguments: 
          {"email": email}
          );    
  }
}
