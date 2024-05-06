import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  final String uid;
  final String? email;
  final String? photoURL;
  final String? displayName;

  AppUser({
    required this.uid,
    this.email,
    this.photoURL,
    this.displayName,
  });

  factory AppUser.fromFirebaseUser(User user) {
    return AppUser(
      uid: user.uid,
      email: user.email,
      photoURL: user.photoURL,
      displayName: user.displayName,
    );
  }
}
