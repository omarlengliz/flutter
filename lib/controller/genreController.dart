import 'dart:convert';

import 'package:get/get.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/core/functions/handlingData.dart';
import "package:http/http.dart" as http;
import 'package:ktebbi/data/model/Genre.dart';
import 'package:ktebbi/linkapi.dart';

abstract class GenreController extends GetxController {
  fetchGenres();
}

class GenreControllerImp extends GenreController {
  List<GenreModel> genres = <GenreModel>[] ; 
  StatusRequest? statusRequest;
  @override
  void onInit() {
    fetchGenres(); 
    super.onInit();
  }

  @override
  Future<void> fetchGenres() async {
    const String apiUrl = AppLink.getGenres;
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await http.get(Uri.parse(apiUrl));
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          final List<dynamic> genreData = jsonData['data'];

          genres.assignAll(
          genreData.map((json) => GenreModel.fromJson(json)).toList(),
        );
              await Future.delayed(Duration(seconds: 2)); // Introduce a 2-second delay

          statusRequest = StatusRequest.success;
          update();
        } else {
          Get.defaultDialog(
            title: 'Warning',
            middleText: 'e',
          );
        }
      }
    } catch (error) {
      // Handle error
      Get.defaultDialog(
            title: 'Warning',
            middleText: error.toString(),
          );    }
  }
}
