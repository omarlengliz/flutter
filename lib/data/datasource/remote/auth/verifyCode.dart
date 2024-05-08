import 'package:ktebbi/core/class/crud.dart';
import 'package:ktebbi/linkapi.dart';

class VerifyCode{
  Crud crud; 
  VerifyCode(this.crud) ; 
  getData(
    String? email  , 
    String? code
  ) async{
    var response =await crud.postData(AppLink.verifCode, {
      "email" : email, 
      "verificationCode" :code 
      
    }) ; 
    return response.fold((l) => l, (r) => r) ; 
  } 
}