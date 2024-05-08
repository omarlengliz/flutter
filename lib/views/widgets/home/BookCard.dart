import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ktebbi/controller/bookController.dart';
import 'package:ktebbi/core/constants/color.dart';
import 'package:ktebbi/core/constants/sizes.dart';
import 'package:ktebbi/core/functions/helper.dart';
import 'package:ktebbi/core/functions/shadowBox.dart';
import 'package:ktebbi/data/model/Book.dart';
import 'package:ktebbi/views/widgets/home/RoundedIcon.dart';
import 'package:ktebbi/views/widgets/home/RoundedImage.dart';
import 'package:ktebbi/views/widgets/roundedContainer.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book,  this.isWishlist = false});
  final BookModel book ;
  final bool isWishlist;

  @override
  Widget build(BuildContext context) {
    Get.put(BookControllerImp());
    final dark = THelperFunctions.isDarkMode(context);
    return  GetBuilder<BookControllerImp>(
      builder: (controler) {
        return Container(
          width: 280,
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            boxShadow: [CardBoxShadow.cardShadow] , 
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? AppColor.darkerGrey : Colors.white,
          ),
          child: Column(
            children: [
              RoundedContainer(
                height: 180,
                width: 280,
                padding: EdgeInsets.all(TSizes.sm),
                backgroundColor: dark ? AppColor.dark : AppColor.light,
                child:Stack(
                  children: [
                     RoundedImage(imageUrl: book.imageUrl ,isNetworkImage: true, applyImageRaidus: true,fit: BoxFit.cover , backgroundColor: Colors.transparent,
                      height: 180,
                      width: 280,
                    ) , 
                    Positioned(
                      top: 0,
                      left: 0,
                      child: RoundedIcon(icon: Icons.remove_red_eye, onPressed: (){
                        controler.goToBookDetail(book.id);
                      } , size: TSizes.lg,  )
                      ) , 
                    
                    Positioned(
                      top: 0,
                      right: 0,
                      child: RoundedIcon(icon: Icons.favorite, onPressed: (){
                        isWishlist? controler.removeFromWhishlist(book) : controler.addToWhishlist(book) ; 
                        controler.update();
                      } , size: TSizes.lg, color : controler.checkInWhichlist(book) == true? Colors.red : AppColor.white))
                    
                  ],
                ) ,
              ) , 
              Padding(
                padding: EdgeInsets.only(left: TSizes.sm),
                child: Column(
                  children: [
                    Text(book.name , style: Theme.of(context).textTheme.titleLarge!.apply(color: dark ? AppColor.white : AppColor.dark), maxLines: 2, overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,) , 
                    const SizedBox(height: TSizes.spaceBtwItems/2,) ,
                    Text(book.author , style: Theme.of(context).textTheme.labelSmall!.apply(color: dark ? AppColor.white : AppColor.dark), maxLines: 1, overflow: TextOverflow.ellipsis,) ,
        
        
                  ],
                ),
              
              )
            ],
          ),
        );
      }
    );
  }
}