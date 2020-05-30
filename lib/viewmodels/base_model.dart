import 'package:fb_clone/locator.dart';
import 'package:fb_clone/model/user_model.dart';
import 'package:fb_clone/services/auth_service.dart';
import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier{

  bool _busy = false;
  bool get busy => _busy;

  final AuthService _auth = locator<AuthService>();
  User get user => _auth.user;

  void setBusy(bool value){
    _busy = value;
    notifyListeners();
  }
}