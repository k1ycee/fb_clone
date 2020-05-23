import 'package:fb_clone/constants/route_constants.dart';
import 'package:fb_clone/locator.dart';
import 'package:fb_clone/services/auth_service.dart';
import 'package:fb_clone/utils/navigator.dart';
import 'package:fb_clone/viewmodels/base_model.dart';

class AuthViewModel extends BaseModel{

  final AuthService _auth = locator<AuthService>();
  final Navigation _navigation = locator<Navigation>();
   

  Future signIn({String email, String password})async{
    setBusy(true);
    final inning = await _auth.signin(email: email, password: password);
    setBusy(false);
    if(inning is bool){
      if(inning){
        await _navigation.navto(PostView);
      }
      else{
        return "Awkward";      
      }
    }
    else{
      return "User already exists";
    }
  }


  Future signUp({String email, String password})async{

    setBusy(true);
    final uping = await _auth.signup(email: email, password: password);
    setBusy(false);
    if(uping is bool){
      if(uping){
        await _navigation.navto(PostView);
      }
      else{
        return "Awkward";      
      }
    }
    else{
      return "User already exists";
    }
  }
}