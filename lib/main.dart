import 'package:fb_clone/constants/route_constants.dart';
import 'package:fb_clone/locator.dart';
import 'package:fb_clone/router.dart';
import 'package:fb_clone/utils/navigator.dart';
import 'package:flutter/material.dart';

void main() {
  finder();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Startup,
      onGenerateRoute: generateRoute,
      navigatorKey: locator<Navigation>().navPersona,
    );
  }
}
