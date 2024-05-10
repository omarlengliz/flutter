import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ktebbi/controller/auth/signUpController.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/core/constants/sizes.dart';
import 'package:ktebbi/core/functions/helper.dart';
import 'package:ktebbi/views/widgets/auth/formDivider.dart';
import 'package:ktebbi/views/widgets/loader.dart';

import '../../../core/constants/color.dart';

class SignUp extends StatelessWidget {
  const  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context) ; 
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(),
      body:  SingleChildScrollView(
        child: GetBuilder<SignUpControllerImp>( builder: (controller) =>
          controller.statusRequest ==StatusRequest.loading ? const Loader() :      Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SignUpTitle".tr,
                  style: Theme.of(context).textTheme.headlineMedium,
                ) , 
                const SizedBox(height: TSizes.spaceBtwSections,) , 
                 Form(
                  child: Column(
                    children: [
          
                       Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller.firstname,
                              decoration:  InputDecoration(
                                labelText: 'FirstName'.tr , 
                                prefixIcon: const Icon(Icons.person),
                              ),
                              expands: false,
                            ),
                          ) , 
                          const SizedBox(width: TSizes.spaceBtwInputFields,) ,
                          Expanded(
                            child: TextField(
                              controller: controller.lastname,
                              decoration:  InputDecoration(
                                labelText: 'LastName'.tr , 
                                prefixIcon: Icon(Icons.person),
                              ),
                              expands: false,
                            ),
                          ) ,                       ],
                      ),
                      const SizedBox(height:TSizes.spaceBtwInputFields,) ,
                       TextField(
                        controller: controller.username,
                        decoration:  InputDecoration(
                          labelText: 'UserName'.tr , 
                          prefixIcon: Icon(Icons.person),
                        ),
                      ) ,
                      const SizedBox(height:TSizes.spaceBtwInputFields,) ,
                       TextField(
                        controller: controller.email,
                        decoration:  InputDecoration(
                          labelText: 'Email'.tr , 
                          prefixIcon: Icon(Icons.email),
                        ),
                      ) ,
                      const SizedBox(height:TSizes.spaceBtwInputFields,) ,
                       TextField(
          
                        controller: controller.phone,
                        decoration:  InputDecoration(
                          labelText: 'Phone'.tr , 
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ) ,
                      const SizedBox(height:TSizes.spaceBtwInputFields,) ,
                       TextField(
                        controller: controller.password,
          
                        decoration:  InputDecoration(
                          labelText: 'Password'.tr , 
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.visibility),
                        ),
                      ) ,
                      const SizedBox(height:TSizes.spaceBtwSections,) ,
                      Row(
                        
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(value: false, onChanged: (val){})
                            
                            ) ,
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Agree'.tr , 
                                  style: Theme.of(context).textTheme.bodySmall
                                ) ,
                                TextSpan(
                                  text: 'PrivacyPolicy'.tr , 
                                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                                    color: dark ? AppColor.white : AppColor.primary , 
                                    decoration: TextDecoration.underline , 
                                    decorationColor: dark ? AppColor.white : AppColor.primary
                                  ) , 
          
                                ) ,
                                TextSpan(
                                  text: 'And'.tr , 
                                  style: Theme.of(context).textTheme.bodySmall
                                ) ,
                                TextSpan(
                                  text: 'TermsOfUse'.tr , 
                                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                                    color: dark ? AppColor.white : AppColor.primary , 
                                    decoration: TextDecoration.underline , 
                                    decorationColor: dark ? AppColor.white : AppColor.primary
                                  ) , ) , 
                                  TextSpan(text: '.' , style: Theme.of(context).textTheme.bodySmall ) 
                              ]
                            )
          
                          )
          
          
                        ],
                      ) , 
                      const SizedBox(height:TSizes.spaceBtwSections,) ,
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){
                          controller.signUp() ;
                        }, child:  Text('SignUp'.tr))
                      ) ,
                      const SizedBox(height:TSizes.spaceBtwSections,) ,
                      const FormDivider() , 
                    ],
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
