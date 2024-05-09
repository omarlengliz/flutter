import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/views/widgets/appBar.dart';
import 'package:ktebbi/views/widgets/home/BookCard.dart';
import 'package:ktebbi/views/widgets/loader.dart';

import '../../controller/bookController.dart';
import '../../core/constants/sizes.dart';
import '../../data/model/Book.dart';

class whishList extends StatelessWidget {
  const whishList({super.key});

  @override
  Widget build(BuildContext context) {
        Get.put(BookControllerImp());

    return  Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            AppBarCustom(
        onLeadingTap: (){},
      ),
             GetBuilder<BookControllerImp>(builder: (contoller) {
                if (contoller.statusRequest == StatusRequest.loading) {
                  return const Center(
                    child: Loader(),
                  );
                } else {
                  if (contoller.wishlist.isEmpty) {
                    return  Center(
                      child: Text("wishlistEmpty".tr, style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
                    );
                  } else {
                    return Column(
                      children: [
                        GridView.builder(
                          itemCount: contoller.wishlist.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                               const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: TSizes.gridViewSpacing,
                            crossAxisSpacing: TSizes.gridViewSpacing,
                            mainAxisExtent: 288,
                          ),
                          itemBuilder: (_, index) {
                            BookModel book = contoller.wishlist[index];
                            return BookCard(book: book , isWishlist: true);
                          },
                        )
                      ],
                    );
                  }
                }
              }),
          ]
          
      
      )
    ));
  }
}