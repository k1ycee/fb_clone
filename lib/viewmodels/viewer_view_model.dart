import 'package:fb_clone/locator.dart';
import 'package:fb_clone/model/post_model.dart';
import 'package:fb_clone/model/viewer_model.dart';
import 'package:fb_clone/services/firestore_service.dart';
import 'package:fb_clone/utils/navigator.dart';
import 'package:fb_clone/viewmodels/base_model.dart';

class ViewerViewModel extends BaseModel{


  FireStoreService _store = locator<FireStoreService>();
  Navigation nav = locator<Navigation>();

  List<Poster> _view;
  List<Poster> get view => _view;



  void getposts(){
    setBusy(true);
    _store.listenToUpdates().listen((dpost) { 
      List<Poster> updates = dpost;
      if(updates != null && updates.length > 0){
        _view = updates;
        notifyListeners();
      }
      setBusy(false);
    });
  }


  Future like(int like)async{
      setBusy(true);

      if(like < 50){
        var res = await _store.like(Viewer(like: like +=1));
        setBusy(false);
        if(res is String){
          return "Wahala";
        }
      }
      else{
        return "You have maxed out on likes";
      }
    }

    Future comment(String comment)async{
      setBusy(true);

      var res = await _store.comment(Viewer(comment: comment));

      setBusy(false);
      if(res is String){
        return "Yawa dey oh";
      }
      else{
        nav.pop();
      }
    }

    
}