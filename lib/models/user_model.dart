class AppUser{
  final String uid;

  AppUser(this.uid);
}

class UserData {
  final String uid;
  final String? displayName;


  UserData({required this.uid, required this.displayName});
}