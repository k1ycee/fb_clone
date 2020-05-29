import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageService{
  
  Future <CloudStorageResult> uploadImage({ @required File imageToUpload,@required String title})async{
    var imagename = title + DateTime.now().millisecondsSinceEpoch.toString();

    final StorageReference storeRef = FirebaseStorage.instance.ref().child(imagename);

    StorageUploadTask upload = storeRef.putFile(imageToUpload);

    StorageTaskSnapshot figment = await upload.onComplete;

    var downloadUrl = await figment.ref.getDownloadURL();

    if(upload.isComplete){
      var url = downloadUrl.toString();
      return CloudStorageResult(
        imageUrl: url,
        imageFileName: imagename
      );
    }
    return null;
  }
}

class CloudStorageResult{
  final String imageUrl;
  final String imageFileName;

  CloudStorageResult({this.imageUrl, this.imageFileName});
  
}