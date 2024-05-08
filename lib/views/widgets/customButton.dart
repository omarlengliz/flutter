import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktebbi/controller/onBoardingController.dart';
import 'package:ktebbi/core/constants/color.dart';

class CustomButtonOnBoarding extends GetView<onBoardingControllerImpl> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
          textColor: Colors.white,
          onPressed: () {
            controller.next();
          },
          color: AppColor.primary,
          child: const Text("continue")),
    );

  }
}