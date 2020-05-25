import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_clone/model/post_model.dart';

class FireStoreService{

  CollectionReference _posterColl = Firestore.instance.collection('Post');

  Future post(Poster post)async{
    try{
      await _posterColl.add(post.toJson());
    }
    catch(e){
      print(e.toString());
    }
  }

}