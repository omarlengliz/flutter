
import 'package:flutter/material.dart';
import 'package:ktebbi/core/constants/color.dart';
import 'package:ktebbi/core/constants/sizes.dart';
import 'package:ktebbi/core/functions/helper.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key, required this.image, required this.title,  this.textColor = AppColor.white, this.backgroundColor=AppColor.white, this.onTap,
  });
  final String image, title ; 
  final Color textColor ; 
  final Color? backgroundColor ;
  final void Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
           children: [
             Container(
               width: 56 , 
               height: 56,
               padding: const EdgeInsets.all(TSizes.sm),
               decoration: BoxDecoration(
                 color: backgroundColor ?? (dark ? AppColor.black : AppColor.white),
                 borderRadius: BorderRadius.circular(100)
               ),
               child:  Center(
                 child: Image(image: AssetImage(image ),fit: BoxFit.cover, color: AppColor.dark,),
               ),
             ) , 
             const SizedBox(height:TSizes.spaceBtwItems/2,) ,
             SizedBox(
               width: 50,
               child: 
               Text(title , style: Theme.of(context).textTheme.labelSmall!.apply(color: textColor),maxLines: 1, overflow: TextOverflow.ellipsis,))
           ],
         ),
      ),
    );
  }
}
