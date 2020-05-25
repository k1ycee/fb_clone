import 'package:fb_clone/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AuthService{
  // Instansiating the Firebase Auth class as a private object _auth
  FirebaseAuth _auth = FirebaseAuth.instance;


  User _user;

  User get user => _user;


// Firebase Sign-up
  Future signup({String email, String password})async{
    try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return user != null;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
// Firebase SignIn
  Future signin({String email, String password})async{
    try{
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return user != null;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }


// Firebase Signout 
  Future signOut()async{
    try{
      await _auth.signOut();
    }
    catch(e){
      print(e.toString());
    }
  }
}