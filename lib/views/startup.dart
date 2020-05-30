import 'package:fb_clone/viewmodels/start_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider_architecture/provider_architecture.dart';



class StartUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<StartUpViewModel>.withConsumer(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) => model.handleStartUp(),
      builder: (context, model, _) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: SpinKitChasingDots(size: 50, color: Colors.blue,),),
      ),
    );
  }
}