import 'package:fb_clone/locator.dart';
import 'package:fb_clone/model/user_model.dart';
import 'package:fb_clone/services/auth_service.dart';
import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier{

  final AuthService _auth = locator<AuthService>();

  User get currentUser => _auth.user;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value){
    _busy = value;
    notifyListeners();
  }
}