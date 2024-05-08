

// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:get/get.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/core/constants/routes.dart';
import 'package:ktebbi/core/functions/handlingData.dart';
import 'package:ktebbi/core/services/services.dart';
import 'package:ktebbi/data/model/Book.dart';
import 'package:ktebbi/linkapi.dart';
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class BookController extends GetxController {
    fetchBooks();
    addToWhishlist(BookModel book) ;  
    removeFromWhishlist(BookModel book) ; 
    checkInWhichlist(BookModel book); 
    loadFromWhishlist() ; 
    goToBookDetail(String id) ; 
}

class BookControllerImp extends BookController {
  List<BookModel> books = <BookModel>[] ; 
  StatusRequest? statusRequest;
  List<BookModel> wishlist = <BookModel>[] ;
  MyServices myServices = Get.find() ;
 

  @override
  void onInit() {
    super.onInit();
    loadFromWhishlist() ;
    fetchBooks(); 
    myServices.init() ;
    

  }
  @override
  Future<void> fetchBooks() async {
    
     const String apiUrl = AppLink.getBooks;
    statusRequest = StatusRequest.loading;
    update();
    try {
      final response = await http.get(Uri.parse(apiUrl));
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          final List<dynamic> bookData = jsonData['data'];
          for (var i = 0; i < bookData.length; i++) {
           books.add (BookModel.fromJson(bookData[i]));
          }
         
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
          );

  }
  
  }
  
  
  
  @override
  Future<void> removeFromWhishlist(BookModel book) async {

    final listString = myServices.sharedPreferences.getStringList("whishList") ?? [] ;
              statusRequest = StatusRequest.loading;

    if(checkInWhichlist(book) == true){
      wishlist.remove(book) ;
      listString.remove(jsonEncode(book.toJson())) ;
      myServices.sharedPreferences.setStringList("whishList", listString) ;
      loadFromWhishlist() ;
      Future.delayed(Duration(seconds: 1)); 
      statusRequest = StatusRequest.success;
      update() ;
    }else{
      Get.defaultDialog(title: "Warning", middleText: "Not in whishlist" ) ;

    }

  }
  
  @override
  addToWhishlist(BookModel book) {
    final listString = myServices.sharedPreferences.getStringList("whishList") ?? [] ;
    if(checkInWhichlist(book) == false){
      wishlist.add(book) ;
      listString.add(jsonEncode(book.toJson())) ;
      myServices.sharedPreferences.setStringList("whishList", listString) ;
      loadFromWhishlist() ;
      update() ;
    }else{
      Get.defaultDialog(title: "Warning", middleText: "Already in whishlist" ) ; 
    }
    // TODO: implement addToWhishlist
  }
  
  @override
  bool checkInWhichlist(BookModel book) {
    loadFromWhishlist() ;
    return wishlist.any((element) => element.id == book.id) ;
  }
  
  @override
  Future<void> loadFromWhishlist() async {

    final listString = await myServices.sharedPreferences.getStringList("whishList") ?? [] ;
    wishlist = listString.map((e) => BookModel.fromJson(jsonDecode(e))).toList() ;

    // TODO: implement loadFromWhishlist

  }
  
  @override
  goToBookDetail(String id) {
    Get.toNamed(AppRoute.bookDetails , arguments: {
      "id" : id
    }) ;
  }



}
