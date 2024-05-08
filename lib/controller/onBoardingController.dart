import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktebbi/core/constants/routes.dart';
import 'package:ktebbi/core/services/services.dart';
import 'package:ktebbi/data/datasource/static/static.dart';

abstract class onBoardingController extends GetxController{
  next() ; 
  onPageChanged(int index) ; 
}
// ignore: camel_case_types
class onBoardingControllerImpl extends onBoardingController{
  int currentPage= 0 ; 
  late PageController pageController ; 
  MyServices myServices = Get.find() ; 
  @override
  next() {
    currentPage++ ; 
    if(currentPage>OnBoardingList.length-1) {
        myServices.sharedPreferences.setString("step", "1") ;
        Get.offAllNamed(AppRoute.login) ; 
    }
    else
      {  
          pageController.animateToPage(currentPage, duration: Duration(milliseconds: 900), curve: Curves.easeInOut ) ;
      }
    }

  @override
  onPageChanged(int index) {
    currentPage=index ; 
    update() ; 
  }
  @override
  void onInit() {
    pageController = PageController() ; 
    super.onInit();
  }
 
}