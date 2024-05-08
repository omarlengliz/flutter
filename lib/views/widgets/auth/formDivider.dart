import 'package:flutter/material.dart';
import 'package:ktebbi/core/constants/color.dart';
import 'package:ktebbi/core/functions/helper.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context) ;
    return   Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child: Divider(color: dark ?AppColor.darkGrey :AppColor.grey , thickness: 0.5 , indent: 60, endIndent: 5,)),
                    Text("OR" , style: Theme.of(context).textTheme.labelMedium,),
                    Flexible(child: Divider(color: dark ?AppColor.darkGrey :AppColor.grey , thickness: 0.5 , indent: 5, endIndent: 60,))
                  ],
                );
  }
}