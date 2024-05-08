import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ktebbi/core/class/statusRequest.dart';
import 'package:ktebbi/core/functions/checkInterner.dart';
import 'package:http/http.dart' as http;


class Crud{
  Future<Either<StatusRequest , Map >> postData(linurl , Map data) async{
   
   try {
    if(await checkInternet() ){
      var res = await http.post(Uri.parse(linurl) , body: data , )  ; 
      if(res.statusCode ==200 || res.statusCode == 201 ) 
      {
        Map resBody = jsonDecode(res.body) ; 
        return right(resBody) ; 
      }else{
        return const Left(StatusRequest.serverFailure);
      }
    }else{
        return const Left(StatusRequest.offlineFailure);
    }
   }catch(error) {
    return const Left(StatusRequest.serverFailure) ; 
   }
  }

  Future<Either<StatusRequest , Map >> getData(linurl) async{
   
   try {
    if(await checkInternet() ){
      var res = await http.get(Uri.parse(linurl) , )  ; 
      if(res.statusCode ==200 || res.statusCode == 201 ) 
      {
        Map resBody = jsonDecode(res.body) ; 
        return right(resBody) ; 
      }else{
        return const Left(StatusRequest.serverFailure);
      }
    }else{
        return const Left(StatusRequest.offlineFailure);
    }
   }catch(error) {
    return const Left(StatusRequest.serverFailure) ; 
   }
  }
}