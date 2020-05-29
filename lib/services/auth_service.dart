import 'package:fb_clone/locator.dart';
import 'package:fb_clone/model/post_model.dart';
import 'package:fb_clone/model/user_model.dart';
import 'package:fb_clone/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AuthService{
  // Instansiating the Firebase Auth class as a private object _auth
  FirebaseAuth _auth = FirebaseAuth.instance;
  final FireStoreService _store = locator<FireStoreService>();


  Poster _user;

  Poster get user => _user;

// Making sure the user is always available at all times 

Future _populateUser(FirebaseUser user)async{
  if(user != null){
    _user = await _store.getUser(user.uid);
    // return _user;
  }
}


// Firebase Sign-up
  Future signup({String email, String password})async{
    try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;

    await _store.post(Poster(userId: result.user.uid));
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

// To know login state of the User

  Future<bool> isUserAround()async{
    var dUser = await _auth.currentUser();
    await _populateUser(dUser);
    return user != null;
  }
}