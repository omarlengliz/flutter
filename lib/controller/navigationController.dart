import 'package:get/get.dart';
import 'package:ktebbi/views/screens/Home.dart';
import 'package:ktebbi/views/screens/WishList.dart';
import 'package:ktebbi/views/screens/settings.dart';

abstract class NavigationController extends GetxController {
  void onDestinationSelected(int index);

}

class NavigationControllerImpl extends NavigationController {
    final screens=[
        const HomeView() , 
        const whishList(),
        const Settings() 
    ] ; 
    
    int selectedIndex = 0 ;
    @override
      void onDestinationSelected(int index){
        selectedIndex = index ; 
        update();
    }
    
    
  
  
}