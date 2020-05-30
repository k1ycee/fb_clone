import 'package:fb_clone/locator.dart';
import 'package:fb_clone/model/user_model.dart';
import 'package:fb_clone/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

// Instansiating the Firebase Auth class as a private object _auth
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirestoreService service = locator<FirestoreService>();

  User _user;
  User get user => _user;


// populate with the user
  Future populateWithUser(FirebaseUser user)async{
    if(user != null){
      _user = await service.getUser(user.uid);
    }
  }


// Firebase Sign-up
  Future signup({String email, String password})async{
    try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    await service.createUser(User(userId: result.user.uid));
    await populateWithUser(result.user);
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
    await populateWithUser(result.user);
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

  Future <bool> isUserav()async{
    var user = await _auth.currentUser();
    await populateWithUser(user);
    return user != null;
  }
}