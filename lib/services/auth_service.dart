import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:letsgo/models/user_model.dart';

class AuthService {
  final auth.FirebaseAuth _fireBaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return _fireBaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signInEmailAndPassword(String email, String password) async {
    try {
      final credential = await _fireBaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(credential.user);
    } catch (e) {
      print('error $e');
    }
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await _fireBaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(credential.user);
    } catch (e) {
      print('error $e');
    }
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
