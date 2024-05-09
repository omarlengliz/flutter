import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:ktebbi/controller/auth/splashScreenController.dart';
import 'package:ktebbi/core/constants/color.dart';
import 'package:ktebbi/core/constants/sizes.dart';
import 'package:ktebbi/core/functions/helper.dart';
import 'package:ktebbi/views/widgets/loader.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    var dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(SplashScreenController());
    Timer(Duration(seconds: 6), () {
      controller.goToMain();
    });
    return Scaffold(
        backgroundColor: dark ? AppColor.dark : AppColor.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                dark ? 'assets/images/dark.png' : 'assets/images/light.png',

                width: 125, // Set width
                height: 125, // Set height
                fit: BoxFit.contain,
              )
                  .animate()
                  
                  . // baseline=800ms
                  fadeIn(duration: Duration(seconds: 3))
                  .scaleXY(
                    begin: 0, // begin value
                    end: 2.5, // end value
                    duration: Duration(seconds: 3), // duration value
                  ).then(delay: Duration(milliseconds: 1)) .slide(
                    begin: Offset(0, 0), // begin value
                    end: Offset(0, -0.5), // end value
                    duration: Duration(seconds: 1), ),// duration value
                  
              // const SizedBox(
              //   height: 40,
              // ),
              Text(
                'welcomeMessage'.tr,
                style: Theme.of(context).textTheme.headlineMedium!.apply(
                    color: dark ? AppColor.light : AppColor.dark,
                    fontWeightDelta: 2),
              ).animate().fadeIn(delay:Duration(seconds: 1) , duration: Duration(seconds: 5)).slide(
                    begin: Offset(0, 1), // begin value
                    end: Offset(0, 0), // end value
                    duration: Duration(seconds: 5), // duration value
                  
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // const CircularProgressIndicator(
              //   valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary),
              // ),
            ],
          ),
        ));
  }
}
