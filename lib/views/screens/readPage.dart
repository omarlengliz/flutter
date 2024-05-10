import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktebbi/controller/bookDetailsController.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/core/constants/color.dart';
import 'package:ktebbi/core/constants/sizes.dart';
import 'package:ktebbi/core/functions/helper.dart';
import 'package:ktebbi/views/widgets/home/RoundedIcon.dart';
import 'package:ktebbi/views/widgets/loader.dart';

class ReadPage extends StatelessWidget {
  const ReadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BookDetailsControllerImp());
    final dark = THelperFunctions.isDarkMode(context) ; 
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<BookDetailsControllerImp>(
          builder: (controllerBook) {
            if (controllerBook.statusRequest == StatusRequest.loading) {
              return Center(child: Loader());
            }
            if (controllerBook.statusRequest == StatusRequest.failure) {
              return Center(child: Text("Error"));
            }
            return Column(
              children: controllerBook.book.pageContent
                  .map((e) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Chapter ${controllerBook.book.pageContent.indexOf(e)+1}",
                              style: Theme.of(context).textTheme.headlineLarge?.apply(color: dark ?AppColor.light : AppColor.black ),
                            ),
                          ),
                          SizedBox(width: TSizes.spaceBtwItems,) , 
                          RoundedIcon(icon: Icons.play_arrow ,backgroundColor: dark? AppColor.light.withOpacity(0.4): AppColor.dark.withOpacity(0.4) ,)
                        ],
                      ) , 
                      Container(
                            padding: const EdgeInsets.all(8),
                            child: Text(e , style: Theme.of(context).textTheme.bodyMedium?.apply(color: dark ?AppColor.light : AppColor.black ),),
                          ),
                    ],
                  ))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
