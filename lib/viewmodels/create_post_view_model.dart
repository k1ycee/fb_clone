import 'dart:io';

import 'package:fb_clone/constants/route_constants.dart';
import 'package:fb_clone/locator.dart';
import 'package:fb_clone/model/post_model.dart';
import 'package:fb_clone/services/cloud_storage.dart';
import 'package:fb_clone/services/firestore_service.dart';
import 'package:fb_clone/utils/image_picker.dart';
import 'package:fb_clone/utils/navigator.dart';
import 'package:fb_clone/viewmodels/base_model.dart';
import 'package:flutter/material.dart';

class CreatePostViewModel extends BaseModel {

  final FireStoreService _store = locator<FireStoreService>();
  final Navigation _nav = locator<Navigation>();
  final ImageSelector selectImg = locator<ImageSelector>();
  final StorageService storage = locator<StorageService>();


  File _selectedImg;

  File get selectedImg => _selectedImg;


  Future selectImage()async{
    var dImg = await selectImg.selectImage();
    if(dImg != null){
      _selectedImg = dImg;
      notifyListeners();
    }
  }

  Future aPost({String postbody}) async {


    setBusy(true);

    // CloudStorageResult result;

    // result = await storage.uploadImage(imageToUpload: _selectedImg, title: "IMG");

    var res = await _store
        .post(Poster(
          article: postbody, 
          // articleImgurl: result.imageUrl,
          // articleImgName: result.imageFileName
          ));


    setBusy(false);


    if (res is String) {
      _nav.pop();
      return "error";
    } else {
      _nav.navto(PostView);
    }
  }

}
