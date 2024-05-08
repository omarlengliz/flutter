import 'package:flutter/material.dart';
import 'package:ktebbi/core/constants/color.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({super.key,
   this.width =400 , this.height=400, this.raidus=400, this.padding = 0, this.backgroundColor=AppColor.white  , this.child});
      final double? width ; 
      final double? height ;
      final double? raidus ; 
      final double? padding ; 
      final Color? backgroundColor ; 
      final Widget? child ; 

  @override
  Widget build(BuildContext context) {
    return   Container(
                    width: width,
                    height: height , 
                    padding:  EdgeInsets.all(padding!),
                    decoration:  BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(raidus!) ,
                      
                    ),
                    child: child,

                  );
  }
}