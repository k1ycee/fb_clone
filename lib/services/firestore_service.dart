import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_clone/model/post_model.dart';
import 'package:fb_clone/model/user_model.dart';
import 'package:fb_clone/model/viewer_model.dart';

class FireStoreService{

  CollectionReference _posterColl = Firestore.instance.collection('Post');
  CollectionReference _userColl = Firestore.instance.collection('User');
  CollectionReference _viewer = Firestore.instance.collection('Viewer');

  final StreamController <List<Poster>> _viewerController = 
  StreamController <List<Poster>>.broadcast();



  Future post(Poster post)async{
    try{
      await _posterColl.document('Post').setData(post.toJson());
    }
    catch(e){
      print(e.toString());
    }
  }

  Future like(Viewer like)async{
    try{
      await _posterColl.document('Post').updateData(like.toJson());
    }
    catch(e){
      print(e.toString());
    }
  }

   Future comment(Viewer like)async{
    try{
      await _posterColl.document('Post').updateData(like.toJson());
    }
    catch(e){
      print(e.toString());
    }
  }

  Future getUser(String id)async{
    try{
      var userData = await _userColl.document(id).get();
      return Poster.fromdata(userData.data);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Stream listenToUpdates(){
    _posterColl.snapshots().listen((posts) { 
      if(posts.documents.isNotEmpty){
        var post = posts.documents.map((pees) => Poster.fromdata(pees.data)).
        // where((element) => element !=null).
        toList();
        _viewerController.add(post);
      }
    });
    return _viewerController.stream;
  }
}