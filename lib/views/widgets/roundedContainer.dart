import 'package:flutter/material.dart';
import 'package:ktebbi/core/constants/color.dart';
import 'package:ktebbi/core/constants/sizes.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({super.key, this.width, this.height, this.radius=TSizes.cardRadiusLg, this.child, this.borderColor=AppColor.borderPrimary, this.backgroundColor=AppColor.white, this.padding, this.margin,  this.showBorder=false});
  final double? width ;
  final double? height ;
  final double radius ;
  final Widget? child ;
  final bool showBorder;
  final Color borderColor ;
  final Color backgroundColor ;
  final EdgeInsetsGeometry? padding ;
  final EdgeInsetsGeometry? margin ;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ),
        color: backgroundColor,
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}