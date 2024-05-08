import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ktebbi/controller/bookDetailsController.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/core/constants/color.dart';
import 'package:ktebbi/core/constants/imageassets.dart';
import 'package:ktebbi/core/constants/sizes.dart';
import 'package:ktebbi/core/functions/helper.dart';
import 'package:ktebbi/views/widgets/appBar.dart';
import 'package:ktebbi/views/widgets/curvedEdges.dart';
import 'package:ktebbi/views/widgets/home/RoundedIcon.dart';
import 'package:ktebbi/views/widgets/loader.dart';
import 'package:ktebbi/views/widgets/roundedContainer.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:typewritertext/typewritertext.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var dark = THelperFunctions.isDarkMode(context);
    Get.put(BookDetailsControllerImp());
    return Scaffold(body: SingleChildScrollView(
      child: GetBuilder<BookDetailsControllerImp>(builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return const Center(
            child: Loader(),
          );
        } else {
          if(controller.statusRequest == StatusRequest.failure) {
            return const Text("error") ;
          } else {
            return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookImage(dark: dark, ontap: () { controller.goBack(); }, imgUrl: controller.book.imageUrl,),
              const SizedBox(
                height: TSizes.defaultSpace,
              ),
              Title(
                dark: dark,
                title: controller.book.name,
              ),
              Genre(
                dark: dark,
              ),
              const SizedBox(
                height: TSizes.defaultSpace,
              ),
              TextData(
                dark: dark,
                field: "Author".tr,
                data: controller.book.author,
              ),
              const SizedBox(
                height: TSizes.defaultSpace,
              ),
              TextData(
                dark: dark,
                field: "RelaseDate".tr,
                data: controller.book.releaseDate.toString(),
              ),
              const SizedBox(
                height: TSizes.defaultSpace,
              ),
              TextData(
                dark: dark,
                field: "Pages".tr,
                data: controller.book.pages.toString(),
              ),
              const SizedBox(
                height: TSizes.defaultSpace,
              ),
              TextData(
                dark: dark,
                field: "LanguageTitle".tr,
                data: controller.book.language,
              ),
              const SizedBox(
                height: TSizes.defaultSpace,
              ),
              Container(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Summary" , style: Theme.of(context).textTheme.headlineLarge!.apply(color: dark?AppColor.light: AppColor.dark),) ,
                    MaterialButton(textTheme: Theme.of(context).buttonTheme.textTheme, onPressed: (){
                      controller.setExapnded(true) ;
                      controller.getSummary() ; 
                    },
                    child: Text("Sumrraize th book right now"),
                    )
                ],),
              ),
              controller.expanded ? Container(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: controller.geminiStatus ==StatusRequest.loading ?Loader()  : TypeWriterText(
                              maintainSize: false,
                              text: Text(controller.summraize ??""),
                              duration: const Duration(milliseconds: 1),
                            ) ,
              ) :Container()  , 


              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.defaultSpace,
                    vertical: TSizes.defaultSpace / 2),
                decoration: BoxDecoration(
                  color: dark ? AppColor.darkerGrey : AppColor.light,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(TSizes.defaultSpace),
                      topRight: Radius.circular(TSizes.defaultSpace)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    controller.progress==-1 ?Text("ReadMessage".tr ,style: Theme.of(context).textTheme.labelLarge!.apply(
                      color : dark ? AppColor.light : AppColor.black 
                    ),) : 
                    Container(
                      width: 200,
                      height: 20,
                      decoration: BoxDecoration(
                        color: dark ? AppColor.darkerGrey : AppColor.dark,
                        borderRadius:
                            BorderRadius.circular(TSizes.defaultSpace),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: 200.0 * controller.progress>-1 ? controller.progress : 0,
                            height: 20,
                            decoration: BoxDecoration(
                              color: dark
                                  ? AppColor.primary
                                  : AppColor.secondary.withOpacity(0.5),
                              borderRadius:
                                  BorderRadius.circular(TSizes.defaultSpace),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              controller.progress.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .apply(
                                      color: dark
                                          ? AppColor.light
                                          : AppColor.light),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              controller.goToReading() ; 
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(TSizes.md),
                                backgroundColor:
                                    AppColor.black.withOpacity(0.8),
                                side:
                                    const BorderSide(color: AppColor.black)),
                            child: Text(
                              controller.progress  > -1 ?  "ContinueRead" : "Read" ,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .apply(color: AppColor.light),
                            ),
                          ),
                          RoundedIcon(
                            icon: Icons.share,
                            backgroundColor: AppColor.black.withOpacity(0.8),
                            onPressed: () async {
                              final urlImage =
                                  "https://images-platform.99static.com//PiHWJxAcOnC7gw197YEXKtyxDXQ=/fit-in/500x500/99designs-contests-attachments/39/39493/attachment_39493946";
                              final url = Uri.parse(urlImage);
                              final response = await http.get(url);
                              final bytes = response.bodyBytes;
                              final tempDir = await getTemporaryDirectory();
                              final path = "${tempDir.path}/image.jpg";
                              File(path).writeAsBytesSync(bytes);
                              ;
                              await Share.shareFiles([path],
                                  text: "The Hobbit", subject: "The Hobbit");
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          );
          }
                }
      }),
    ));
  }
}

class TextData extends StatelessWidget {
  const TextData({
    super.key,
    required this.dark,
    required this.field,
    required this.data,
  });

  final bool dark;
  final String field;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: TSizes.defaultSpace,
          left: TSizes.defaultSpace,
          bottom: TSizes.defaultSpace),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            field,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: dark ? AppColor.light : AppColor.dark),
          ),
          const SizedBox(
            width: TSizes.defaultSpace,
          ),
          Text(
            data,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .apply(color: dark ? AppColor.light : AppColor.dark),
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
    required this.dark,
    this.title,
  });
  final String? title;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: TSizes.defaultSpace,
          left: TSizes.defaultSpace,
          bottom: TSizes.defaultSpace),
      child: Center(
          child: Text(
        title ?? "",
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .apply(color: dark ? AppColor.light : AppColor.dark),
      )),
    );
  }
}

class Genre extends StatelessWidget {
  const Genre({
    super.key,
    required this.dark,
  });
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: TSizes.defaultSpace,
          left: TSizes.defaultSpace,
          bottom: TSizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Genre",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: dark ? AppColor.light : AppColor.dark),
              ),
              const SizedBox(
                width: TSizes.defaultSpace,
              ),
              RoundedContainer(
                radius: TSizes.sm,
                backgroundColor: AppColor.secondary.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.sm, vertical: TSizes.xs),
                child: Text(
                  "Fantasy",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: AppColor.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BookImage extends StatelessWidget {
  const BookImage({
    super.key,
    required this.dark, required this.ontap, required this.imgUrl,
  });

  final bool dark;  
  final String imgUrl ; 
  final VoidCallback ontap ;

  

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedEdges(),
      child: Container(
        color: dark ? AppColor.darkerGrey : AppColor.light,
        child: Stack(
          children: [
             SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(
                      child:
                          Image(image: NetworkImage(imgUrl))),
                )),
            AppBarCustom(
              onLeadingTap: ontap,
              showBackArrow: true,
              leadingIcon: Icons.arrow_back,
              actions: [
                RoundedIcon(
                  color: dark ? AppColor.light : AppColor.light,
                  backgroundColor: dark
                      ? AppColor.dark.withOpacity(0.4)
                      : AppColor.light.withOpacity(0.4),
                  icon: Icons.favorite_outline,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
