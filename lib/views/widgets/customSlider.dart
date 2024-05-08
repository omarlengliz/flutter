import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktebbi/controller/onBoardingController.dart';
import 'package:ktebbi/data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<onBoardingControllerImpl>  {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
      var query= MediaQuery.of(context).size ; 
      return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: OnBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Image.asset(
                  OnBoardingList[i].image!,
                  width:query.width ,
                   height: query.height*0.4,
                ),
                const SizedBox(height: 80),
                Text(OnBoardingList[i].title!,
                    style: Theme.of(context).textTheme.headlineLarge ,textAlign: TextAlign.center,),
                const SizedBox(height: 20),
          
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      OnBoardingList[i].body!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
              ],
            ));

  }
}