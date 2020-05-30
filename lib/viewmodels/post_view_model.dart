import 'package:fb_clone/locator.dart';
import 'package:fb_clone/model/post_model.dart';
import 'package:fb_clone/services/firestore_service.dart';
import 'package:fb_clone/utils/navigator.dart';
import 'package:fb_clone/viewmodels/base_model.dart';

class PostViewModel extends BaseModel {
  FirestoreService _store = locator<FirestoreService>();
  Navigation nav = locator<Navigation>();

  List<Post> _view;
  List<Post> get view => _view;

  void getposts() {
    setBusy(true);
    _store.listenToUpdates().listen((dpost) {
      List<Post> updates = dpost;
      if (updates != null && updates.length > 0) {
        _view = updates;
        notifyListeners();
      }
      setBusy(false);
    });
  }
}
