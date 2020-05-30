import 'package:fb_clone/constants/route_constants.dart';
import 'package:fb_clone/locator.dart';
import 'package:fb_clone/model/post_model.dart';
import 'package:fb_clone/services/firestore_service.dart';
import 'package:fb_clone/utils/navigator.dart';
import 'package:fb_clone/viewmodels/base_model.dart';

class CreatePostViewModel extends BaseModel{

  FirestoreService _firestoreService = locator<FirestoreService>();
  Navigation _nav = locator<Navigation>();

  Future post(String post)async{

    setBusy(true);

    var dpst = await _firestoreService.createPost(Post(postTitle: post, userId: user.userId));

    setBusy(false);

    if(dpst is String){
      print("We need settle some kind matter for here");
    }
    else{
      print("Matter don settle for here to the next matter");
      _nav.navto(PostView);
    }
  }
}