import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:letsgo/models/user_model.dart';

import 'database.dart';

class AuthService {
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  AppUser? _userFromFirebase(User? user) {
    return user != null ? AppUser(user.uid) : null;
  }

  Stream<AppUser?>? get user {
    return _fireBaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future signInEmailAndPassword(String email, String password) async {
    try {
      final credential = await _fireBaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = credential.user;
      return _userFromFirebase(credential.user);
    } catch (e) {
      print('error $e');
    }
    return null;
  }

  Future createUserWithEmailAndPassword(String displayName, String email, String password) async {
    try {
      final credential = await _fireBaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = credential.user;
      if (user == null) {
        throw Exception("No user found");
      } else {
        await DatabaseService(user.uid).saveUser(displayName);

        return _userFromFirebase(credential.user);
      }
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future <void> userSetup(String displayName) async{
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    String? uid = _fireBaseAuth.currentUser?.uid.toString();
    users.add({'displayName': displayName, 'uid': uid});
    return;
  }

  Future resetPassword(String email) async {
    try {
      return await _fireBaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('error $e');
    }
  }

  Future<void> signOut() async {
    try {
      return await _fireBaseAuth.signOut();
    } catch (e) {
      print('error $e');
    }
  }
}
