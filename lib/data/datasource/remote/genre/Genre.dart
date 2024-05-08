import 'package:ktebbi/core/class/Crud.dart';
import 'package:ktebbi/linkapi.dart';

class Genre{
  Crud crud; 
  Genre(this.crud) ; 
  getData( ) async{
    var response =await crud.getData(AppLink.getGenres) ; 
    return response.fold((l) => l, (r) => r) ; 
  } 
}