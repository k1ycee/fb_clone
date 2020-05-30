import 'package:fb_clone/constants/route_constants.dart';
import 'package:fb_clone/locator.dart';
import 'package:fb_clone/services/auth_service.dart';
import 'package:fb_clone/utils/navigator.dart';
import 'package:fb_clone/viewmodels/base_model.dart';

class StartUpViewModel extends BaseModel{

  Navigation nav = locator<Navigation>();
  AuthService service = locator<AuthService>();


  Future handleStartUp()async{

    var handler = await service.isUserav();

    if(handler){
       nav.navto(PostView);
    }
    else{
       nav.navto(AuthView);
    }
  }
}