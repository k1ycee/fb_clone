
import 'package:fb_clone/locator.dart';
import 'package:fb_clone/model/viewer_model.dart';
import 'package:fb_clone/services/firestore_service.dart';
import 'package:fb_clone/utils/navigator.dart';
import 'package:fb_clone/viewmodels/base_model.dart';

class ThotsViewModel extends BaseModel{


  
  FireStoreService _store = locator<FireStoreService>();
  Navigation nav = locator<Navigation>();

  List<Viewer> _thots;
  List<Viewer> get thot => _thots;

  void getThots(){
      setBusy(true);
      _store.listenToUpdates().listen((dpost) { 
        List<Viewer> updates = dpost;
        if(updates != null && updates.length > 0){
          _thots = updates;
          notifyListeners();
        }
        setBusy(false);
      });
    }

    
}