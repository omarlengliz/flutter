import 'package:get/get.dart';
import 'package:ktebbi/controller/networkController.dart';
import 'package:ktebbi/core/class/crud.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController());
    
  }

}