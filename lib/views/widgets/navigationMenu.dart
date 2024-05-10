import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktebbi/controller/navigationController.dart';
import 'package:ktebbi/core/constants/color.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavigationControllerImpl());
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GetBuilder<NavigationControllerImpl>(
       builder: (controller) =>  
      Scaffold(
      bottomNavigationBar: 
       NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex,
          backgroundColor: isDark ? AppColor.black : Colors.white,
          indicatorColor: isDark ? AppColor.white.withOpacity(0.1): AppColor.black.withOpacity(0.1),
          onDestinationSelected : (index)=>{
            controller.onDestinationSelected(index)
          }, 
          destinations:  [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home'.tr,
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite),
              label: 'whishlist'.tr,
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Settings'.tr,
            ),
          ],
        ),
      body: controller.screens[controller.selectedIndex],
      ),
    );
  }
}
