import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class InternetController extends GetxController {
  var hasInternet = true.obs;

  @override
  void onInit() {
    super.onInit();
    check();
    // Listen for connectivity changes
    Connectivity().onConnectivityChanged.listen((result) {
      check();
    });
  }

  void check() async {
    bool isConnected = await checkInternet();
    hasInternet.value = isConnected;
  }

  Future<bool> checkInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}