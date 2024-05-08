import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ktebbi/controller/auth/loginController.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/core/constants/imageassets.dart';
import 'package:ktebbi/core/constants/sizes.dart';
import 'package:ktebbi/core/functions/helper.dart';
import 'package:ktebbi/views/widgets/auth/formDivider.dart';
import 'package:ktebbi/views/widgets/loader.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context) ; 
     Get.put(LoginControllerImp());

    return  Scaffold(
      body: PopScope(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<LoginControllerImp>(
              builder: (controller) {
                if(controller.statusRequest == StatusRequest.loading) {
                  return const Center(child: Loader(),);
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                          
                            image: AssetImage(dark ? AppImageAsset.darklogo : AppImageAsset.lightlogo),
                            height: 150,
                            fit: BoxFit.contain,
                            width: 150,
                          ),
                          Text("WelcomeBackTitle".tr , style: Theme.of(context).textTheme.headlineMedium), 
                          const SizedBox(height:TSizes.sm,) , 
                          Text(
                            "WelcomeBackBody".tr
                             , style: Theme.of(context).textTheme.bodySmall), 
                        
                          
                        ],
                      ) , 
                       Form(
                        child: Padding(
                          padding:  const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
                          child: Column(
                            children: [
                                 TextField(
                                  controller: controller.email,
                                  decoration:  InputDecoration(
                                    prefix: const Icon(Icons.email) ,
                                    labelText: "Email".tr , 
                                  ),
                                ) , 
                                const SizedBox(height:TSizes.spaceBtwInputFields,) ,
                                 GetBuilder<LoginControllerImp>(
                                  builder: (controller) => 
                                TextField(
                                    
                                    controller: controller.password,
                                    obscureText: controller.isshowpassword,
                                    decoration:  InputDecoration(
                                      
                                      prefix: Icon(Icons.lock) ,
                                      labelText: 'Password'.tr , 
                                      suffix: IconButton(
                                        icon: Icon( !controller.isshowpassword ?  Icons.visibility_off : Icons.visibility) , 
                                        onPressed: () {
                                          print(controller.isshowpassword);
                                          controller.showPassword() ; 
                                        },
                                        
                                      ) ,
                                    ),
                                                               ),
                                 ) ,
                                const SizedBox(height:TSizes.spaceBtwInputFields/2,) ,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(value: true, onChanged: (val){}) ,
                                         Text('RememberMe'.tr )  , 
                                      ],
                                    ),
                                        TextButton(onPressed: (){
                                          controller.goToForgetPassword() ;
                                        }, child:  Text('ForgotPassword'.tr)) 
                                  ],
                                ),
                                 const SizedBox(height:TSizes.spaceBtwSections) ,
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(onPressed: (){
                                    controller.login() ; 
                                  }, child:  Text('Login'.tr))
                                ) ,
                                const SizedBox(height:TSizes.spaceBtwItems) ,
                                SizedBox(
                                  width: double.infinity,
                                  child: OutlinedButton(onPressed: (){
                                    controller.goToSignUp() ; 
                                  }, child:  Text('CreateAccount'.tr))
                                ) ,
                          
                          
                          
                          ],
                          ),
                        )
                      ) , 
                      const FormDivider() , 
                     
                  ],
                );
              }
            ),
            )
          ),
          onPopInvoked: (val) {
            THelperFunctions.showAlert("Close alert", "are you sure you want to close the app?");
          },
      ),
    );
  }
}
