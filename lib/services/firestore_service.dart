import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_clone/model/post_model.dart';
import 'package:fb_clone/model/user_model.dart';

class FirestoreService {
  CollectionReference postColl = Firestore.instance.collection("Post");
  CollectionReference userColl = Firestore.instance.collection("User");

  final StreamController<List<Post>> _viewerController =
      StreamController<List<Post>>.broadcast();

  Future createUser(User user) async {
    try {
      await userColl.document(user.userId).setData(user.toJson());
      return true;
    } catch (e) {
      print(e.toString());
    }
  }

  Future createPost(Post post) async {
    try {
      await postColl.add(post.toJson());
      return true;
    } catch (e) {
      print(e.toString());
    }
  }

  Future getUser(String id) async {
    try {
      var userdata = await userColl.document(id).get();
      return User.fromJson(userdata.data);
    } catch (e) {
      print(e.toString());
    }
  }

  Stream listenToUpdates() {
    postColl.snapshots().listen((posts) {
      if (posts.documents.isNotEmpty) {
        var post = posts.documents
            .map((pees) => Post.fromJson(pees.data, pees.documentID))
            .
            // where((element) => element !=null).
            toList();
        _viewerController.add(post);
      }
    });
    return _viewerController.stream;
  }

  Future like(Post like, String docId)async{
    try{
      await postColl.document(docId).updateData({'like' : like.like});
    }
    catch(e){
      print(e.toString());
    }
  }
}
