
import 'package:flutter/material.dart';
import 'package:ktebbi/core/constants/color.dart';

class CardBoxShadow{
  static final cardShadow = BoxShadow(
    color: AppColor.darkGrey.withOpacity(0.1) , 
    blurRadius: 50 , 
    spreadRadius: 7 ,
    offset: const Offset(0, 2)
  ) ; 
}