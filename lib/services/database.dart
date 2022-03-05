import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class DatabaseService {
  final String uid;

  DatabaseService(this.uid);

  final CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection("users");

  Future<void> saveUser(String displayName) async {
    return await userCollection.doc(uid).set({'displayName': displayName});
  }

  UserData _userFromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception("user not found");
    return UserData(
      uid: snapshot.id,
      displayName: data['displayName'],
    );
  }

  Stream<UserData> get user {
    return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }

  List<UserData> _userListFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return _userFromSnapshot(doc);
    }).toList();
  }

  Stream<List<UserData>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }
}
