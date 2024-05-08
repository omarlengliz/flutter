import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktebbi/controller/genreController.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/views/widgets/loader.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      Get.put(GenreControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text('Genres'),
      ),
      body: Center(              ),
    
    );
  }
}
