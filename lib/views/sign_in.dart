import 'package:fb_clone/locator.dart';
import 'package:fb_clone/utils/navigator.dart';
import 'package:fb_clone/viewmodels/auth_view_model.dart';
import 'package:fb_clone/widgets/auth_text_field_widget.dart';
import 'package:fb_clone/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class AuthScreen extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final Navigation nav = locator<Navigation>();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<AuthViewModel>.withConsumer(
      viewModelBuilder: () => AuthViewModel(),
      builder: (context, model, _) => Scaffold(
        backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text('Facebook', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.blue[400]),),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text('Connect with friends and\nstay safe', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: AuthField(
            controller: emailController,
            text: 'Email',
          ),
        ),
        SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: AuthField(
            controller: passwordController,
            text: 'Password',
            password: true,
          ),
         ),      
         SizedBox(height: 15,),
         Padding(
           padding: const EdgeInsets.only(left: 30.0),
           child: RichText(
             text: TextSpan(
               text: 'By signing up, you have accepted the ',
               style: TextStyle(fontSize: 12, color: Colors.grey[400], fontWeight: FontWeight.w500),
               children: <TextSpan>[
                 TextSpan(text: 'Terms and\nConditions', style: TextStyle(color: Colors.blue[400], fontWeight: FontWeight.w600)),
                  TextSpan(text: ' of this service', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w500)),
               ]
             ),
            ),
         ),
         SizedBox(height: 10,),
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Button(
                 onPressed: (){
                   model.busy;
                   model.signIn(email: emailController.text, password: passwordController.text);
                 },
                 text: Text('Sign In',style: TextStyle(color: Colors.white, fontSize: 20),),
                 color: Colors.blue,
              ),
              Button(
                onPressed: (){
                  model.busy;
                  model.signUp(email: emailController.text, password: passwordController.text);
                },
                text: Text('Register', style: TextStyle(color: Colors.white, fontSize: 20),),
                color: Colors.indigo[900],
              ),
           ],
           ),
         )
        ],
      ),
     ),
    );
  }
}