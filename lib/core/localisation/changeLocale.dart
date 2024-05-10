import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktebbi/core/services/services.dart';

class LocaleController extends GetxController{
  Locale? language ; 
  MyServices myServices = Get.find() ;
  changeLang (String codeLang) {
    Locale locale = Locale(codeLang);
    
    myServices.sharedPreferences.setString("lang", codeLang) ; 
    Get.updateLocale(locale) ;
  }
  @override
  void onInit() {
    String? sharedPreferencesLang= myServices.sharedPreferences.getString("lang") ;
    if(sharedPreferencesLang=="ar"){
      changeLang("ar") ; 
    }
    else if(sharedPreferencesLang=="en"){
      changeLang("en") ;
    }else{
      changeLang("fr") ;
    }
    super.onInit();
  }
}