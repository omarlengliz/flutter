
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktebbi/core/constants/color.dart';

import '../appBar.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBarCustom(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome'.tr, style: Theme.of(context).textTheme.labelMedium!.apply(color: AppColor.grey),),
          Text('Omar Lengliz', style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColor.white),),
    
        ],
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
