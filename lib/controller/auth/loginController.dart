import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/core/constants/routes.dart';
import "package:http/http.dart" as http;
import 'package:ktebbi/core/functions/handlingData.dart';
import 'package:ktebbi/core/services/services.dart';
import 'package:ktebbi/data/model/User.dart';
import 'package:ktebbi/linkapi.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
  showPassword();
  getUserDetails() ; 
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;
  StatusRequest? statusRequest;
  MyServices myServices = Get.find() ;
  // late UserModel userModel  ;


 @override
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    statusRequest = StatusRequest.loading;
    update();

    // try{
      
    final response =await  http.post(Uri.parse(AppLink.login) , body: {
      "email" : email.text , 
      "password" : password.text
    }) ; 

    statusRequest = handlingData(response ) ; 
    if(statusRequest == StatusRequest.success) {
        if(response.statusCode == 200 ) {
                    final jsonData = jsonEncode(response.body);
                    
                    myServices.sharedPreferences.setString("user" , json.encode(jsonData))  ;
                    myServices.sharedPreferences.setString("step" , "2")  ;

                                        statusRequest = StatusRequest.success ;

                    Get.offAllNamed(AppRoute.home)  ; 


        }else{
          if(response.statusCode == 404) {
            Get.defaultDialog(title: "error" , middleText: "User Not found") ; 
            statusRequest = StatusRequest.failure ;
          }else{
            Get.defaultDialog(middleText: "Invalid credentials") ; 
            statusRequest = StatusRequest.failure ;
          }
        }
                    update() ;

    }


    // }catch(e){
    //   print(e)  ;
      
    // }
      
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    // userModel =  getUserDetails() ;
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
  
  @override
  getUserDetails() async {
    final user = await myServices.sharedPreferences.getString("user") ; 
    print(user) ; 
    if(user != null) {
      print(user) ; 
      // print(userModel.firstname) ; 
    }else {
      print("hello");
      
    }
  }
}
