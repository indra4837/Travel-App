import 'package:firebase_auth/firebase_auth.dart';
import 'package:myfirstapp/models/user.dart';

class AuthService {

  // sign in anon

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null; 
  }

  // sign in with email and password
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password

  // sign out

}