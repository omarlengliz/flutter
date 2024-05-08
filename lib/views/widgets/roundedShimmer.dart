import 'package:flutter/material.dart';
import 'package:ktebbi/core/constants/color.dart';
import 'package:ktebbi/core/constants/sizes.dart';
import 'package:ktebbi/core/functions/helper.dart';
import 'package:shimmer/shimmer.dart';

class RoundedShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return SizedBox(
      height: 80,
      child: ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __)=>SizedBox(width: TSizes.spaceBtwItems,),
        itemBuilder: (_, __) {
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: dark ? Colors.grey[850]! :  Colors.grey[300]!,
                highlightColor: dark ? Colors.grey[700]! :  Colors.grey[100]!,
                child: Container(
              width: 56 , 
               height: 56,
               padding: const EdgeInsets.all(TSizes.sm),
               decoration: BoxDecoration(
                 color:  (dark ? AppColor.darkerGrey : AppColor.white),
                 borderRadius: BorderRadius.circular(100)
               ),
                ),
              )
            ],
          )
          ;
        },
      ),
    ) ; 
  }
}