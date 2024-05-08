import 'package:flutter/material.dart';
import 'package:ktebbi/core/constants/color.dart';
import 'package:ktebbi/core/constants/sizes.dart';
import 'package:ktebbi/core/functions/helper.dart';

class RoundedIcon extends StatelessWidget {
  const RoundedIcon({super.key, this.width, this.height, this.size=TSizes.lg, required this.icon, this.color=AppColor.white, this.backgroundColor, this.onPressed});
  final double? width,height , size ;
  final IconData icon ;
  final Color? color ;
  final Color? backgroundColor ;
  final VoidCallback? onPressed ;



  @override
  Widget build(BuildContext context) {
    final dark =THelperFunctions.isDarkMode(context);
    return  Container(
      width: width , 
      height: height,
                  decoration: BoxDecoration(
                    color: backgroundColor != null ? backgroundColor! : dark?AppColor.black.withOpacity(0.9) : AppColor.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(100), 
                  ),
                  child: IconButton(
                    onPressed: onPressed,
                    icon: Icon(icon, color:color, size: size,
                  ), )

                  
                )  ;
  }
}