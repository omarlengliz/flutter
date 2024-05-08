
import 'package:flutter/material.dart';
import 'package:ktebbi/core/constants/color.dart';
import 'package:ktebbi/core/constants/sizes.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key, required this.text, this.icon, required this.showBackground, required this.showBorder, this.onTap,
  });
  final String text ; 
  final IconData? icon ;
  final bool showBackground , showBorder ; 
  final void Function()? onTap ; 



  @override
  Widget build(BuildContext context) {
    var query=MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Container(
          width: query.width  ,
          padding: const EdgeInsets.all(TSizes.md),
          decoration:  BoxDecoration(
             border: showBorder ?  Border.all(color: AppColor.grey.withOpacity(0.5)) : null,
            color: showBackground ?isDark?  AppColor.dark : AppColor.light : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg)
          ),
          child:  Row(
            children: [
               Icon(icon , color: AppColor.darkGrey,) ,
              const SizedBox(width:TSizes.spaceBtwItems,) ,
              Text(text , style: Theme.of(context).textTheme.bodySmall ,)
      
            ],
          ),
        ),
      ),
    );
  }
}
