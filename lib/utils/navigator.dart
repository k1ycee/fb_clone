import 'package:flutter/cupertino.dart';

class Navigation{

  GlobalKey<NavigatorState> _navPersona = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navPersona => _navPersona;


  void pop(){
    _navPersona.currentState.pop();
  }

  Future <dynamic> navto(String routename, {dynamic arguements}){
    return _navPersona.currentState.pushNamed(routename, arguments: arguements);
  }
}