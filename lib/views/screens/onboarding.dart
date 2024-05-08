import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktebbi/controller/onBoardingController.dart';
import 'package:ktebbi/views/widgets/customSlider.dart';

import '../widgets/customButton.dart';
import '../widgets/dotController.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(onBoardingControllerImpl()) ; 
     return const Scaffold(
        body: SafeArea(
          child: Column(children: [
            Expanded(
              flex: 4,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomDotControllerOnBoarding(),
                    Spacer(flex: 2),
                    CustomButtonOnBoarding()
                  ],
                ))
          ]),
        ));
  }
}