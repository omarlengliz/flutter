import 'package:get/get.dart';
import 'package:ktebbi/controller/networkController.dart';

class DependencyInjection {
  static void init() {
    print("DependencyInjection init") ;
      NetworkController networkController=  Get.put<NetworkController>(NetworkController() , permanent: true);
      networkController.update() ; 
    }
}