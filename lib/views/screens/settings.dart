import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ktebbi/controller/auth/LogoutController.dart';
import 'package:ktebbi/core/Theme/Theme.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/core/constants/color.dart';
import 'package:ktebbi/core/constants/imageassets.dart';
import 'package:ktebbi/core/constants/sizes.dart';
import 'package:ktebbi/core/functions/helper.dart';
import 'package:ktebbi/core/localisation/changeLocale.dart';
import 'package:ktebbi/data/datasource/static/static.dart';
import 'package:ktebbi/views/widgets/LanguageAppButton.dart';
import 'package:ktebbi/views/widgets/ModeAppButton.dart';
import 'package:ktebbi/views/widgets/appBar.dart';
import 'package:ktebbi/views/widgets/headerContainer.dart';
import 'package:ktebbi/views/widgets/home/RoundedIcon.dart';
import 'package:ktebbi/views/widgets/home/RoundedImage.dart';
import 'package:ktebbi/views/widgets/home/headingSection.dart';
import 'package:ktebbi/views/widgets/loader.dart';
import 'package:ktebbi/views/widgets/settingsMenu.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    var dark=THelperFunctions.isDarkMode(context) ;
    Get.put(LogoutControllerImp());
    ThemeController themeController = Get.put(ThemeController()) ;
  LocaleController localeController = Get.put(LocaleController()) ;
  List<Widget> modes=[
        ModeAppButton(title: "DarkMode".tr , onTap: (){
         themeController.ChangeTheme("dark") ;
        },) , 
        ModeAppButton(title: "LightMode".tr, onTap: (){
          themeController.ChangeTheme("light") ;
        },)  , 
        ModeAppButton(title: "SystemMode".tr, onTap: (){
          themeController.ChangeTheme("default") ;
        },) , 
    ] ; 

  List<Widget> languages=[
        LanguageAppButton(title: "Arabic".tr, flagUrl: AppImageAsset.arFlag, onTap:(){
          localeController.changeLang("ar") ;
        } ,) ,
        LanguageAppButton(title: "English".tr, flagUrl: AppImageAsset.enFlag,
        onTap:(){
          localeController.changeLang("en") ;

        } ,
        ) , 
        LanguageAppButton(title: "French".tr, flagUrl: AppImageAsset.frFlag,

        onTap:(){
          localeController.changeLang("fr") ;

          
        } , 
        ) ,
    ] ;

    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<LogoutControllerImp>(
          builder: (controller) {
            if(controller.statusRequest == StatusRequest.loading){
              return Center(child: Loader(),);
            }
            return Column(
              children: [
                HeaderContainer(
                    child: Column(
                  children: [
                    AppBarCustom(
                      title: Text(
                        "Settings".tr,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: AppColor.white),
                      ),
                      showBackArrow: false,
                      onLeadingTap: () {},
                    ),
                    ListTile(
                      leading: const RoundedImage(
                        imageUrl: AppImageAsset.fantasyImage,
                        isNetworkImage: false,
                        borderRadius: 100,
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.zero,
                      ),
                      title: Text(
                        "Omar Lengliz",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: AppColor.white),
                      ),
                      subtitle: const Text(
                        "",
                      ),
                      trailing: RoundedIcon(
                          icon: Icons.edit,
                          color: AppColor.white,
                          backgroundColor: AppColor.darkerGrey,
                          onPressed: () {}),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                )),
                 Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    children: [
                       SectionHeading(
                        title: ("AccountSettings".tr),
                        buttonTitle: '',
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems,) , 
                      SettingsMenuTile(icon: dark ? Icons.dark_mode : Icons.light_mode, title: "ModeTitle".tr, subtitle: "ModeMessage".tr , children:  modes ,),
                      const SizedBox(height: TSizes.spaceBtwItems,) , 
                      SettingsMenuTile(icon:  Icons.language , title: "LanguageTitle".tr, subtitle: "LanguageMessage".tr , children: languages),
                      const SizedBox(height: TSizes.spaceBtwItems,) , 
                      // SettingsMenuTile(icon:  Icons.voice_chat , title: "Voice", subtitle: "select your reader voice" , trailing: Container(width: 25,) ,),
                  
                      const SizedBox(height: TSizes.spaceBtwItems,) ,
                      ModeAppButton(
                        title: "logout".tr,
                        onTap: () {
                         controller.logout();
                        },
                      ),
                    ],
            
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
