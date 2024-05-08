
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktebbi/core/constants/routes.dart';
import 'package:ktebbi/core/localisation/changeLocale.dart';
import 'package:ktebbi/views/widgets/custombuttomlang.dart'; 

class Language extends GetView<LocaleController>{
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1".tr, style: Theme.of(context).textTheme.headlineLarge),
              CustomButtonLang(
                  textbutton: "Ar",
                  onPressed: () {
                    controller.changeLang("ar");
                    Get.toNamed(AppRoute.onBoarding) ; 
                  }),
             const SizedBox(height: 20),

              CustomButtonLang(
                  textbutton: "En",
                  onPressed: () {
                    controller.changeLang("en");
                    Get.toNamed(AppRoute.onBoarding) ; 
                  }),
            ],
          )),
    );
  }
}
