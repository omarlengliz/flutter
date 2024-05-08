import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/core/services/services.dart';
import 'package:ktebbi/data/model/Book.dart';
import "package:http/http.dart" as http;
import 'package:ktebbi/linkapi.dart';

abstract class BookDetailsController extends GetxController {
  fetchBook(String id);
  getProgress();
  saveProgress();
  goBack();
  goToReading();
  getCurrentPage();
  goToPage(int index);
  getSummary();
  setExapnded(bool value) ; 
}

class BookDetailsControllerImp extends BookDetailsController {
  late String id;
  BookModel book = BookModel.empty();
  late FlutterTts flutterTts;
  StatusRequest? statusRequest;
  StatusRequest? geminiStatus ; 
  late double progress = -1;
  String apiUrl = "";
  late Map voice;
  MyServices myServices = Get.find();
  late int currentPage;
  PageController pageController = PageController(initialPage: 0);
  String? summraize = "";
  bool expanded=false; 

  @override
  Future<void> onInit() async {

    id = Get.arguments["id"];
    apiUrl = "${AppLink.books}/$id";
    fetchBook(id);
    progress = getProgress();
   

    if (Get.currentRoute == "/readBook") {
      currentPage = getCurrentPage();
      // pageController=PageController(
      //   initialPage: currentPage

      // ) ;
      // flutterTts = FlutterTts() ;
      // flutterTts.getVoices.then((data) {
      //   try {
      //     List<Map> voices = List<Map>.from(data) ;
      //     voices = voices.where((element) => element["name"].contains("en")).toList() ;

      //     voice= voices.first ;
      //     flutterTts.setVoice({"name" :voice["name"] , "locale" : voice["locale"]});
      //   } catch (e) {

      //   }
    }
    super.onInit();
  }

  @override
  fetchBook(String id) async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      http.get(Uri.parse(apiUrl)).then((response) {
        print(response.statusCode);
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          print(jsonData);
          book = BookModel.fromJson(jsonData["data"]);
          print(book.name);
          statusRequest = StatusRequest.success;
          update();
        } else {
          Get.defaultDialog(
            title: 'Warning',
            middleText: 'Failed to load data',
          );
          update();
        }
      });
    } catch (e) {
      print(e);
      statusRequest = StatusRequest.success;

      Get.defaultDialog(title: 'Warning', middleText: e.toString());
      update();
    }
  }

  @override
  double getProgress() {
    final progress =
        myServices.sharedPreferences.getInt("progress${book.id}") ?? -1;
    if (progress == -1) {
      return progress.toDouble();
    } else {
      return (progress / book.pages).round().toDouble();
    }
  }

  @override
  goBack() {
    // TODO: implement goBack
    Get.back();
  }

  @override
  goToReading() {
    Get.toNamed("/readBook", arguments: [
      {"id": book.id}
    ]);
  }

  @override
  saveProgress() {
    myServices.sharedPreferences.setInt("progress${book.id}", currentPage);
  }

  @override
  int getCurrentPage() {
    return myServices.sharedPreferences.getInt("progress${book.id}") ?? 0;
  }

  @override
  goToPage(int index) {
    saveProgress();
    pageController.jumpToPage(index);
  }

  @override
  getSummary() {
     try{
if (summraize == "") {
      var x="" ; 
      if(Get.locale ==const Locale("fr")) {
          x="resume ce livre ${book.name} en francais"  ; 
      }else{
        if(Get.locale==const Locale("ar")){
          x="تلخيص هذا الكتاب ${book.name} " ;

        }else{
          x="summrize this book : ${book.name} "  ; 
        }
      }
      geminiStatus=StatusRequest.loading;
      update() ; 
      final gemini = Gemini.instance;
      gemini.text(x)
  .then((value) {
    value != null  ? summraize = value?.output.toString()    :  summraize = "x" ;    
          geminiStatus=StatusRequest.success; 
          update()  ; 

    
    }    )  // or value?.content?.parts?.last.text
  .catchError((e) => print(e));

      


    }
     }catch(e){
        Get.defaultDialog(title: "error" , middleText: e.toString()) ;
     }
  }
  
  @override
  setExapnded(bool value) {
      expanded=value;
      update() ;     // TODO: implement setExapnded
  }
}
