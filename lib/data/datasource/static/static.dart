import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktebbi/core/Theme/Theme.dart';
import 'package:ktebbi/core/constants/imageassets.dart';
import 'package:ktebbi/core/localisation/changeLocale.dart';
import 'package:ktebbi/core/services/services.dart';
import 'package:ktebbi/data/model/onBoarding.dart';
import 'package:ktebbi/views/screens/language.dart';
import 'package:ktebbi/views/widgets/LanguageAppButton.dart';
import 'package:ktebbi/views/widgets/ModeAppButton.dart';

List<OnBoardingModel> OnBoardingList = [
  OnBoardingModel(
    title: "OnBoardingTitle1".tr , 
    body: "OnBoardingbody1".tr , 
    image: AppImageAsset.onBoardingImage1
  ) , 
  OnBoardingModel(
    title:   "OnBoardingTitle2".tr, 
    body: "OnBoardingbody2".tr , 
    image: AppImageAsset.onBoardingImage2
  ) , 
  OnBoardingModel(
    title: "OnBoardingTitle3".tr , 
    body:"OnBoardingbody3".tr  , 
    image:AppImageAsset.onBoardingImage3
  ) , 
] ; 

  ThemeController themeController = Get.put(ThemeController()) ;
  LocaleController localeController = Get.put(LocaleController()) ;
  List<Widget> modes=[
        ModeAppButton(title: "DarkMode".tr , onTap: (){
         themeController.ChangeTheme("dark") ;
        },) , 
        ModeAppButton(title: "LightMode".tr, onTap: (){
          themeController.ChangeTheme("light") ;
        },)  , 
        ModeAppButton(title: "SystemMode".tr, onTap: (){
          themeController.ChangeTheme("default") ;
        },) , 
    ] ; 

  List<Widget> languages=[
        LanguageAppButton(title: "Arabic".tr, flagUrl: AppImageAsset.arFlag, onTap:(){
          localeController.changeLang("ar") ;
          localeController.onInit() ; 
        } ,) ,
        LanguageAppButton(title: "English".tr, flagUrl: AppImageAsset.enFlag,
        onTap:(){
          localeController.changeLang("en") ;
                    localeController.onInit() ; 

        } ,
        ) , 
        LanguageAppButton(title: "French".tr, flagUrl: AppImageAsset.frFlag,

        onTap:(){
          localeController.changeLang("fr") ;
                    localeController.update() ; 

          
        } , 
        ) ,
    ] ;