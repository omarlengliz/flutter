import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:ktebbi/controller/auth/splashScreenController.dart';
import 'package:ktebbi/core/constants/color.dart';
import 'package:ktebbi/core/functions/helper.dart';

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

                width: 125, 
                height: 125, 
                fit: BoxFit.contain,
              )
                  .animate()
                  .fadeIn(duration: Duration(seconds: 3))
                  .scaleXY(
                    begin: 0,

                    end: 2.5,
                    duration: Duration(seconds: 3), 
                  )
                  .then(delay: Duration(milliseconds: 1))
                  .slide(
                    begin: Offset(0, 0), 
                    end: Offset(0, -0.5), 
                    duration: Duration(seconds: 1),
                  ), 

            
              Text(
                'welcomeMessage'.tr,
                style: Theme.of(context).textTheme.headlineMedium!.apply(
                    color: dark ? AppColor.light : AppColor.dark,
                    fontWeightDelta: 2),
              )
                  .animate()
                  .fadeIn(
                      delay: Duration(seconds: 1),
                      duration: Duration(seconds: 5))
                  .slide(
                    begin: Offset(0, 1), 
                    end: Offset(0, 0),
                    duration: Duration(seconds: 5), 
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
