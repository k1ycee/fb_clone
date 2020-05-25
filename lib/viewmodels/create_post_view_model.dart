import 'package:fb_clone/constants/route_constants.dart';
import 'package:fb_clone/locator.dart';
import 'package:fb_clone/model/post_model.dart';
import 'package:fb_clone/services/firestore_service.dart';
import 'package:fb_clone/utils/navigator.dart';
import 'package:fb_clone/viewmodels/base_model.dart';

class CreatePostViewModel extends BaseModel{

  final FireStoreService _store = locator<FireStoreService>();
  final Navigation _nav = locator<Navigation>();

  Future aPost({String postbody})async{
    setBusy(true);
    var res = await _store.post(Poster(article: postbody));
    setBusy(false);
    if(res is String){
      _nav.pop();
      return "error";
    }
    else{
      _nav.navto(PostView);
    }
  }
}