import 'package:ktebbi/core/class/crud.dart';
import 'package:ktebbi/linkapi.dart';

class SignUpData{
  Crud crud; 
  SignUpData(this.crud) ; 
  getData(
    String firstname , 
    String lastname , 
    String username , 
    String email , 
    String phone, 
    String password  
  ) async{
    var response =await crud.postData(AppLink.signUp, {
      
        "firstname":firstname , 
        "lastname" : lastname ,
        "username" : username,
        "phone":phone,
        "email" :email , 
        "password" : password
    }) ; 
    return response.fold((l) => l, (r) => r) ; 
  } 
}