import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ktebbi/controller/bookController.dart';
import 'package:ktebbi/controller/genreController.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/core/constants/color.dart';
import 'package:ktebbi/core/constants/imageassets.dart';
import 'package:ktebbi/data/model/Genre.dart';
import 'package:ktebbi/views/widgets/home/verticalImageText.dart';
import 'package:ktebbi/views/widgets/roundedShimmer.dart';

class HomeGenres extends StatelessWidget {
  const HomeGenres({
    super.key, required this.con,
  });
  final BookControllerImp con ; 

  @override
  Widget build(BuildContext context) {
    Get.put(GenreControllerImp());
    return GetBuilder<GenreControllerImp>(
      builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return  RoundedShimmer();
        } else {
          if (controller.genres.isEmpty) {
            return Center(
              child: Text(
                "NoData".tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: AppColor.white),
              ),
            );
          } else {
            return SizedBox(
              height: 80,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.genres.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  GenreModel genre = controller.genres[index];
                  return VerticalImageText(
                    image: AppImageAsset.rootImages + '/' + genre.image,
                    title: genre.name,
                    onTap: () {
                        
                        con.setFilter(genre.name);
                        con.fetchBooks() ; 
                    },
                  );
                },
              ),
            );
          }
        }
      },
    );
  }
}