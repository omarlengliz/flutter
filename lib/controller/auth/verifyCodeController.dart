import 'package:get/get.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/core/constants/routes.dart';
import 'package:ktebbi/core/functions/handlingData.dart';
import "package:http/http.dart" as http;
import 'package:ktebbi/linkapi.dart';

abstract class VerifyCodeController extends GetxController {
  verifyCodeFunc( String pin);
}

class VerifyCodeControllerImpl extends VerifyCodeController {
  StatusRequest? statusRequest;
  String? email;

  @override
  verifyCodeFunc(String pin ) async {
    
  
    statusRequest = StatusRequest.loading;
    update();
    final res=await http.post(Uri.parse(AppLink.verifCode)  , body: {
      "email" : email ,
      "verificationCode" :pin  

    }) ; 

    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res.statusCode == 200 ||  res.statusCode==201 ) {
          Get.toNamed(AppRoute.login) ; 
      } 
    }else {
        Get.defaultDialog(title: "Warning", middleText: "Something went wrong!");
        statusRequest = StatusRequest.failure;
      }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
