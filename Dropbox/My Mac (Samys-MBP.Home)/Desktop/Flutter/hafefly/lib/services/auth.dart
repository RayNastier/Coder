import 'package:firebase_auth/firebase_auth.dart';
import 'package:hafefly/models/userInformation.dart';
import 'package:hafefly/services/database.dart';

import '../models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Userr? _userFromFirebaseUser(User? user) {
    if (user != null) {
      return Userr(uid: user.uid);
    } else {
      return null;
    }
  }

  Stream<Userr?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(
      String email, String password, UserInformation userInformation) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;

      await DatabaseService(uid: user.uid).updateUserData(
          userInformation.firstname,
          userInformation.lastname,
          userInformation.age,
          userInformation.province,
          userInformation.phoneNumber);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signout() async {
    try {
      print('loggedOut');
      return await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


}
