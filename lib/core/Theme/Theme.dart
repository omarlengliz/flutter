import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktebbi/core/services/services.dart';

class ThemeController extends GetxController{
  Locale? language ; 
  MyServices myServices = Get.find() ;
  ChangeTheme (String mode) {
    
    myServices.sharedPreferences.setString("mode", mode) ; 
    if(mode=="dark"){
      Get.changeThemeMode(ThemeMode.dark) ;
    }
    else if(mode=="light"){

      Get.changeThemeMode(ThemeMode.light) ;
    }else{

      Get.changeThemeMode(ThemeMode.system) ;

    }


  }
  ThemeMode getThemeMode(){
    String? sharedPreferencesMode= myServices.sharedPreferences.getString("mode") ;
    if(sharedPreferencesMode=="dark"){
      return ThemeMode.dark ;
    }
    else if(sharedPreferencesMode=="light"){
      return ThemeMode.light ;
    }else{
      return ThemeMode.system ;
    }
  }
  @override
  void onInit() {
    String? sharedPreferencesMode= myServices.sharedPreferences.getString("mode") ;
    if(sharedPreferencesMode=="dark"){
      ChangeTheme("dark") ; 
    }
    else if(sharedPreferencesMode=="light"){
      ChangeTheme("light") ;

    }else{
      ChangeTheme("default") ;
    }

    super.onInit();
  }
}