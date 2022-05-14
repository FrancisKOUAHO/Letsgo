import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:letsgo/models/user_model.dart';

import 'database.dart';
import 'notification_service.dart';

class AuthService {
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AppUser? _userFromFirebase(User? user) {
    initUser(user);
    return user != null ? AppUser(user.uid) : null;
  }

  void initUser(User? user) async {
    if (user == null) return;
    NotificationService.getToken().then((value) {
      DatabaseService(user.uid).saveToken(value);
    });
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
      print(e);
    }
    return null;
  }

  Future createUserWithEmailAndPassword(
      String displayName, String email, String password) async {
    try {
      final credential = await _fireBaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = credential.user;
      if (user == null) {
        Fluttertoast.showToast(
            msg: "Aucun utilisateur trouvé",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        await _firestore
            .collection('users')
            .doc(_fireBaseAuth.currentUser!.uid)
            .set({
          "displayName": displayName,
          "email": email,
          "localization": 'Votre, Position',
          "status": "Unavalible",
          "uid": _fireBaseAuth.currentUser!.uid,
        });

        return _userFromFirebase(credential.user);
      }
    } catch (exception) {
      Fluttertoast.showToast(
          msg: exception.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return null;
    }
  }

  Future<void> userSetup(String displayName) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    String? uid = _fireBaseAuth.currentUser?.uid.toString();
    users.add({'displayName': displayName, 'uid': uid});
    return;
  }

  Future resetPassword(String email) async {
    try {
       await _fireBaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> signOut() async {
    try {
      return await _fireBaseAuth.signOut();
    } catch (e) {
      Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
      );
    }
  }
}
