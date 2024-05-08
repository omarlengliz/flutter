import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ktebbi/controller/auth/sendVerificationCodeController.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/core/constants/color.dart';
import 'package:ktebbi/core/constants/imageassets.dart';
import 'package:ktebbi/core/constants/routes.dart';
import 'package:ktebbi/core/constants/sizes.dart';
import 'package:ktebbi/core/functions/helper.dart';
import 'package:ktebbi/views/widgets/loader.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SendVerificationCodeControllerImpl());
    
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: 
        [  IconButton(
            icon:  const Icon(Icons.close , color: Colors.white),
            onPressed: () {
              Get.offAllNamed(AppRoute.login) ; 
            },
          )]
      ),
      body:  SingleChildScrollView(
        child: GetBuilder<SendVerificationCodeControllerImpl>( builder: (controller) => controller.statusRequest ==StatusRequest.loading ? const Center(child: Loader()) :
        Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                Image(image: const AssetImage(AppImageAsset.darklogo ) , width: THelperFunctions.screenWidth()*0.6 ,) , 
                const SizedBox(height:TSizes.spaceBtwSections,) ,
                Text("Verify your email address" , style: Theme.of(context).textTheme.headlineMedium ,textAlign: TextAlign.center,) ,
                const SizedBox(height:TSizes.spaceBtwItems,) ,
                Text("${controller.email}" , style: Theme.of(context).textTheme.labelLarge ,textAlign: TextAlign.center,) ,
                const SizedBox(height:TSizes.spaceBtwItems,) ,
                Text("🎉 Congratulations! Your Ktebi account is ready and waiting for you to dive into a world of literary delights! 📚 Simply verify your email to begin your journey of exploring a vast collection of books" , style: Theme.of(context).textTheme.labelLarge ,textAlign: TextAlign.center,) ,
                const SizedBox(height:TSizes.spaceBtwSections,) ,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                     controller.goToVerify() ;  
                    },
                    child: const Text("Continue"),
                  ),
                ) ,
                const SizedBox(height:TSizes.spaceBtwItems,)  , 
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                        controller.sendVerificationCode() ; 
                    },
                    child: const Text("Resend Email" , style: TextStyle(color: AppColor.primary)),
                  ),
                )
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}