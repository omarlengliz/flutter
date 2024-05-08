import 'package:flutter/material.dart';
import 'package:ktebbi/core/constants/color.dart';
import 'package:ktebbi/core/constants/sizes.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({super.key, this.width, this.height, required this.imageUrl,  this.applyImageRaidus=true, this.border,  this.backgroundColor=AppColor.light, this.padding,  this.isNetworkImage=false, this.fit, this.onPressed,  this.borderRadius=TSizes.md});
  final double? width , height ;
  final String imageUrl ;
  final bool applyImageRaidus ; 
  final BoxBorder? border ;
  final Color backgroundColor ;
  final EdgeInsetsGeometry? padding ;
  final bool isNetworkImage ;
  final BoxFit? fit ;
  final VoidCallback? onPressed ; 
  final double borderRadius ; 
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(applyImageRaidus ? borderRadius : 0),
          color: backgroundColor,
          border: border,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(applyImageRaidus ? borderRadius : 0),
          child: isNetworkImage ? Image.network(imageUrl, fit: fit) : Image.asset(imageUrl, fit: fit),
        ),
      ),
    );
  }
}