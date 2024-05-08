import 'package:ktebbi/core/class/crud.dart';
import 'package:ktebbi/linkapi.dart';

class SendCode{
  Crud crud; 
  SendCode(this.crud) ; 
  getData(
    String? email
  ) async{
    var response =await crud.postData(AppLink.sendVerificationCode, {
      "email" : email
      
    }) ; 
    return response.fold((l) => l, (r) => r) ; 
  } 
}