import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ktebbi/controller/bookController.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/core/constants/sizes.dart';
import 'package:ktebbi/data/model/Book.dart';
import 'package:ktebbi/views/widgets/headerContainer.dart';
import 'package:ktebbi/views/widgets/home/BookCard.dart';
import 'package:ktebbi/views/widgets/home/headingSection.dart';
import 'package:ktebbi/views/widgets/home/homeAppBar.dart';
import 'package:ktebbi/views/widgets/home/homeGenres.dart';
import 'package:ktebbi/views/widgets/home/searchContainer.dart';
import 'package:ktebbi/views/widgets/loader.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BookControllerImp());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             HeaderContainer(
              child: Column(
                children: [
                  HomeAppbar(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SearchContainer(
                    text: "SearchBook".tr,
                    icon: Icons.search,
                    showBackground: true,
                    showBorder: true,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Padding(
                    padding: Get.deviceLocale?.countryCode=="ar" ?  const EdgeInsets.only(
                        right:TSizes.defaultSpace 
                      , 
                    
                    ) : EdgeInsets.only(  left: TSizes.defaultSpace) , 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeading(
                          title: "Genres".tr,
                          buttonTitle: "View All".tr,
                          showActionButton: false,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        HomeGenres(),

                      ],
                    ),
                  ) , 
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: GetBuilder<BookControllerImp>(builder: (contoller) {
                if (contoller.statusRequest == StatusRequest.loading) {
                  return const Center(
                    child: Loader(),
                  );
                } else {
                  if (contoller.books.isEmpty) {
                    return  Center(
                      child: Column(
                        children: [
                          const Text("No Data"),
                          const SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          MaterialButton(onPressed: (){
                            contoller.fetchBooks() ; 
                          },
                            child: Text("Re try"),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        GridView.builder(
                            itemCount: contoller.books.length,
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
                              BookModel book = contoller.books[index];
                              return BookCard(book: book);
                            },
                          ),
                        
                      ],
                    );
                  }
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
