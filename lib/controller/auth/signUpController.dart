import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/core/constants/routes.dart';
import 'package:ktebbi/core/functions/handlingData.dart';
import 'package:ktebbi/linkapi.dart';
import "package:http/http.dart" as http;

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController firstname;
  late TextEditingController lastname;
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  StatusRequest? statusRequest;

  @override
  signUp() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    print(fcmToken);

    statusRequest = StatusRequest.loading;
    update();
    const String apiUrl = AppLink.signUp;
    try {
      final response = await http.post(Uri.parse(apiUrl), body: {
        "email": email.text,
        "firstname": firstname.text,
        "lastname": lastname.text,
        "username": username.text,
        "phone": phone.text,
        "password": password.text,
        "fcmToken": fcmToken,
      });
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          Get.toNamed(AppRoute.sendCode, arguments: {"email": email.text});
        } else {
          if (response.statusCode == 302) {
            Get.defaultDialog(
                title: "Error", middleText: "User Already exsist");
          } else {
            Get.defaultDialog(
                title: "Error", middleText: "fields are required");
          }
          statusRequest = StatusRequest.failure;
          update();
        }
      }
    } catch (e) {
      Get.defaultDialog(
          title: "Server Error", middleText: "Something won't wrong");
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    firstname = TextEditingController();
    lastname = TextEditingController();

    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstname.dispose();
    lastname.dispose();
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
