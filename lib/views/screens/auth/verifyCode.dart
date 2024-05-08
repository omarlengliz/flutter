import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktebbi/controller/auth/verifyCodeController.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/core/constants/routes.dart';
import 'package:ktebbi/core/constants/sizes.dart';
import 'package:ktebbi/views/widgets/loader.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImpl());
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false, actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Get.offAllNamed(AppRoute.login);
            },
          )
        ]),
        body: SingleChildScrollView(
            child: GetBuilder<VerifyCodeControllerImpl>(
              builder: (controller) {
                return  controller.statusRequest == StatusRequest.loading ? const Loader():  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Verify Your OTP Code",
                                style: Theme.of(context).textTheme.headlineLarge,
                                textAlign: TextAlign.center,
                              )),
                          const SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Enter the OTP code sent to your email address : ",
                                style: Theme.of(context).textTheme.labelLarge,
                                textAlign: TextAlign.center,
                              )),
                          SizedBox(
                              width: double.infinity,
                              child: Text(
                                "${controller.email}",
                                style: Theme.of(context).textTheme.labelMedium,
                                textAlign: TextAlign.center,
                              )),
                          const SizedBox(
                            height: TSizes.spaceBtwSections,
                          ),
                          OTPTextField(
                            length: 4,
                            width: MediaQuery.of(context).size.width*0.8,
                            fieldWidth: 80,
                            style: const TextStyle(fontSize: 17),
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.underline,
                            onCompleted: (pin) {
                              controller.verifyCodeFunc(pin);
                            },
                            onChanged: (pin){
                            },
                          ),
                          const SizedBox(height: 40),
                        ]));
              }
            )));
  }
}
