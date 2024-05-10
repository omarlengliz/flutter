
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktebbi/controller/auth/loginController.dart';
import 'package:ktebbi/core/constants/color.dart';
import 'package:ktebbi/data/model/User.dart';

import '../appBar.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    // UserModel user=login.userModel ;
    // print(user.firstname) ; 
    return AppBarCustom(
      title: GetBuilder<LoginControllerImp>(
        builder: (Controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome'.tr, style: Theme.of(context).textTheme.labelMedium!.apply(color: AppColor.grey),),
              Text('e', style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColor.white),),
              
            ],
          );
        }
      ),
      actions: [
        Stack(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.book, color: AppColor.white)),
            Positioned(
              right: 0,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: AppColor.black,
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Center(child: Text('3', style: Theme.of(context).textTheme.labelLarge!.apply(color: AppColor.white,fontSizeFactor: 0.8),)),
              ),
            )
          ],
        ),
        
      ],
    );
  }
}
