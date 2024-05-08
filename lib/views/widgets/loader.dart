
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:ktebbi/core/constants/color.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: GFLoader(
        loaderColorOne: AppColor.accent,
        size: GFSize.LARGE,
     )); 
  
  }
}