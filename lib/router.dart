import 'package:fb_clone/constants/route_constants.dart';
import 'package:fb_clone/views/create_post.dart';
import 'package:fb_clone/views/post_view.dart';
import 'package:fb_clone/views/sign_in.dart';
import 'package:fb_clone/views/startup.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  
  switch (settings.name) {
    case CreatePostView:
      return _getRoute(
        routeName: settings.name,
        viewToShow: CreatePost(),
      );  
    case PostView:
      return _getRoute(
        routeName: settings.name,
        viewToShow: Posts(),
      );  
    case AuthView:
      return _getRoute(
        routeName: settings.name,
        viewToShow: AuthScreen(),
      ); 
    case Startup:
      return _getRoute(
        routeName: settings.name,
        viewToShow: StartUp(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: Text('Non-Existent View', style: TextStyle(color: Colors.black),), centerTitle: true, elevation: 0,backgroundColor: Colors.white,),
        )
      );
  }
}


PageRoute _getRoute({String routeName, Widget viewToShow}){
  
  return MaterialPageRoute(
    builder: (_) => viewToShow,
    settings: RouteSettings(
      name: routeName
    )
  );
}