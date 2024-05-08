import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktebbi/core/constants/sizes.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key, this.title,  this.showBackArrow=false, this.leadingIcon, this.actions, this.onLeadingTap});
  final Widget? title ;
  final bool showBackArrow ; 
  final IconData? leadingIcon ;
  final List<Widget>? actions ;
  final VoidCallback? onLeadingTap ;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: showBackArrow,
        leading: showBackArrow ? 
          IconButton(onPressed:onLeadingTap, icon:  Icon(leadingIcon , color: Colors.white,)) :
          
          leadingIcon!= null ? IconButton(onPressed: onLeadingTap, icon: Icon(leadingIcon , color: Colors.white,)) : null ,
          title: title,
          actions: actions,

      )
    );
  }
}